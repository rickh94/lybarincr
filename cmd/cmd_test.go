package cmd

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"path"
	"reflect"
	"strings"
	"testing"
)

func TestReadLilypondFile(t *testing.T) {
	// some helpful test fixtures
	tmpDir, err := ioutil.TempDir("", "cmd_test-")
	if err != nil {
		log.Fatal(err)
	}
	defer os.RemoveAll(tmpDir)
	tmpFile := path.Join(tmpDir, "testBadFile.dat")
	err = ioutil.WriteFile(tmpFile, []byte("you can't change this"), 0444)
	if err != nil {
		log.Fatal(err)
	}
	err = os.Chmod(tmpDir, 0000)
	if err != nil {
		log.Fatal(err)
	}
	defer os.Remove("testdata/testfile1.dat.bak")
	// tests
	testFiles := []struct {
		path          string
		expectedLines []string
		expectErr     bool
		name          string
	}{
		{
			"testdata/testfile1.dat",
			[]string{
				"this is a test",
				"this is another line",
			},
			false,
			"test reading testfile 1",
		},
		{
			"/tmp/nothere-30164",
			nil,
			true,
			"test file could not be read raises error",
		},
		{
			tmpFile,
			nil,
			true,
			"test file cannot be written rasies error",
		},
	}
	// test checks
	for _, testFile := range testFiles {
		lines, err := ReadLilypondFile(testFile.path)
		if err != nil {
			if testFile.expectErr {
				continue
			} else {
				t.Errorf("Error: '%s' was raised, but no error was expected.", err)
			}
		}
		if reflect.DeepEqual(lines, testFile.expectedLines) {
			var differences [][]string
			for i, line := range lines {
				testLine := testFile.expectedLines[i]
				if line != testLine {
					differences = append(differences, []string{line, testLine})
				}
				t.Errorf("Lines differ from expected in file %s. Differences: %v", testFile.path, differences)
			}
			t.Errorf("File lines differ from expected")
		}
	}
}

func TestIncrementBarNum(t *testing.T) {
	testLines := []struct {
		inLine    string
		increment int64
		outLine   string
		name      string
	}{
		{"a4 es g -. d | % 1", 1, "a4 es g -. d | % 2", "basic"},
		{"g8 c16 d e f gs | % 122", -1, "g8 c16 d e f gs | % 121", "decrement"},
		{"r8 g8 g g | e2", 1, "r8 g8 g g | e2", "no bar number"},
		{"e8 f f f | \\barNumberCheck #4", 1, "e8 f f f | \\barNumberCheck #5", "bar number check"},
		{"d4 d8. d16 d4 d | % 100", 11, "d4 d8. d16 d4 d | % 111", "increment by more than one"},
		{"\\override font-size = #10", 1, "\\override font-size = #10", "doesn't increment non checks"},
		{"d16 e f g a | % 16", 1, "d16 e f g a | % 17", "doesn't clobber other numbers"},
		{"a2 g16 fs e fs g fs e d | %1", 1, "a2 g16 fs e fs g fs e d | %2", "no space in comment"},
	}
	for _, testLine := range testLines {
		newLine := IncrementBarNum(testLine.inLine, testLine.increment)
		if newLine != testLine.outLine {
			t.Errorf("Failed test %s: got %s, expected %s.\nInput Line: %s\nIncrement:%d", testLine.name, newLine, testLine.outLine, testLine.inLine, testLine.increment)
		}
	}
}

func TestAssembleFile(t *testing.T) {
	testCases := []struct {
		inLines       []string
		increment     int64
		firstLine     int
		lastLine      int
		expectedBytes []byte
		expectErr     bool
		description   string
	}{
		{
			[]string{
				"g8. [ \\mf \\downbow a16 ( \\upbow g8. ) a16 ] (",
				"b8. ) [ d16 ( e8. ) d16 ( ] \\downbow | % 2",
				"g8. [ \\< ) fs16 ( a8. ) g16 ] (",
				"fs8. ) [ a16 ( g8. ) e16 ] ( \\downbow | % 3",
				"d8. ) [ d16 ( e8. ) d16 ] \\> (",
				"g8. ) [ e16 ( d8. ) b16 ] ( \\downbow | % 4",
				"a2 \\! ) d,8 ( \\upbow e8 fs8 a8 ) | % 5",
			},
			1,
			1,
			7,
			[]byte("g8. [ \\mf \\downbow a16 ( \\upbow g8. ) a16 ] (\n" +
				"b8. ) [ d16 ( e8. ) d16 ( ] \\downbow | % 3\n" +
				"g8. [ \\< ) fs16 ( a8. ) g16 ] (\n" +
				"fs8. ) [ a16 ( g8. ) e16 ] ( \\downbow | % 4\n" +
				"d8. ) [ d16 ( e8. ) d16 ] \\> (\n" +
				"g8. ) [ e16 ( d8. ) b16 ] ( \\downbow | % 5\n" +
				"a2 \\! ) d,8 ( \\upbow e8 fs8 a8 ) | % 6",
			),
			false,
			"basic test, increment all by 1",
		},
		{
			[]string{
				"b4 \\< \\downbow b'8. ( a16 ) a4 g4 | \\barNumberCheck #10",
				"g4 \\! \\f fs8. ( e16 ) e4 d4 | % 11",
				"d4 \\mf c8 ( e8 ) d4 c4 | % 12",
				"b8 -- a8 -- g2 -- g8 ( \\upbow a8 ) | % 13",
				"b4 \\< \\downbow b'8. ( a16 ) a4 g4 | % 14",
				"g4 \\! \\f fs8. ( e16 ) \\acciaccatura { fs8 } e4 d4 | % 15",
				"d8 \\mf \\downbow c8 d8 e8 b8 ( a8 ) b8 \\acciaccatura { d8 } c8 | % 16",
				"b4 \\upbow bf2 \\fz ^\\markup{ \\italic {rit.} } \\> -> a4 | % 17",
				"g8. [ \\! \\mf ^\\markup{ \\italic {a tempo} } \\downbow a16 ( \\upbow g8. )",
				"a16 ] ( b8. ) [ d16 ( e8. ) d16 ] ( | % 18",
				"g8. [ \\< ) fs16 ( a8. ) g16 ] ( fs8. ) [ a16 ( g8. ) e16 ] ( | % 19",
			},
			1,
			3,
			9,
			[]byte(
				"b4 \\< \\downbow b'8. ( a16 ) a4 g4 | \\barNumberCheck #10\n" +
					"g4 \\! \\f fs8. ( e16 ) e4 d4 | % 11\n" +
					"d4 \\mf c8 ( e8 ) d4 c4 | % 13\n" +
					"b8 -- a8 -- g2 -- g8 ( \\upbow a8 ) | % 14\n" +
					"b4 \\< \\downbow b'8. ( a16 ) a4 g4 | % 15\n" +
					"g4 \\! \\f fs8. ( e16 ) \\acciaccatura { fs8 } e4 d4 | % 16\n" +
					"d8 \\mf \\downbow c8 d8 e8 b8 ( a8 ) b8 \\acciaccatura { d8 } c8 | % 17\n" +
					"b4 \\upbow bf2 \\fz ^\\markup{ \\italic {rit.} } \\> -> a4 | % 18\n" +
					"g8. [ \\! \\mf ^\\markup{ \\italic {a tempo} } \\downbow a16 ( \\upbow g8. )\n" +
					"a16 ] ( b8. ) [ d16 ( e8. ) d16 ] ( | % 18\n" +
					"g8. [ \\< ) fs16 ( a8. ) g16 ] ( fs8. ) [ a16 ( g8. ) e16 ] ( | % 19",
			),
			false,
			"only do some lines",
		},
		{
			[]string{
				"g8. [ \\mf \\downbow a16 ( \\upbow g8. ) a16 ] (",
				"b8. ) [ d16 ( e8. ) d16 ( ] \\downbow | % 2",
				"g8. [ \\< ) fs16 ( a8. ) g16 ] (",
				"fs8. ) [ a16 ( g8. ) e16 ] ( \\downbow | % 3",
				"d8. ) [ d16 ( e8. ) d16 ] \\> (",
				"g8. ) [ e16 ( d8. ) b16 ] ( \\downbow | % 4",
				"a2 \\! ) d,8 ( \\upbow e8 fs8 a8 ) | % 5",
			},
			-1,
			1,
			7,
			[]byte("g8. [ \\mf \\downbow a16 ( \\upbow g8. ) a16 ] (\n" +
				"b8. ) [ d16 ( e8. ) d16 ( ] \\downbow | % 1\n" +
				"g8. [ \\< ) fs16 ( a8. ) g16 ] (\n" +
				"fs8. ) [ a16 ( g8. ) e16 ] ( \\downbow | % 2\n" +
				"d8. ) [ d16 ( e8. ) d16 ] \\> (\n" +
				"g8. ) [ e16 ( d8. ) b16 ] ( \\downbow | % 3\n" +
				"a2 \\! ) d,8 ( \\upbow e8 fs8 a8 ) | % 4",
			),
			false,
			"decrement",
		},
		{
			[]string{
				"g8. [ \\mf \\downbow a16 ( \\upbow g8. ) a16 ] (",
				"b8. ) [ d16 ( e8. ) d16 ( ] \\downbow | % 2",
				"g8. [ \\< ) fs16 ( a8. ) g16 ] (",
				"fs8. ) [ a16 ( g8. ) e16 ] ( \\downbow | % 3",
				"d8. ) [ d16 ( e8. ) d16 ] \\> (",
				"g8. ) [ e16 ( d8. ) b16 ] ( \\downbow | % 4",
				"a2 \\! ) d,8 ( \\upbow e8 fs8 a8 ) | % 5",
			},
			3,
			1,
			7,
			[]byte("g8. [ \\mf \\downbow a16 ( \\upbow g8. ) a16 ] (\n" +
				"b8. ) [ d16 ( e8. ) d16 ( ] \\downbow | % 5\n" +
				"g8. [ \\< ) fs16 ( a8. ) g16 ] (\n" +
				"fs8. ) [ a16 ( g8. ) e16 ] ( \\downbow | % 6\n" +
				"d8. ) [ d16 ( e8. ) d16 ] \\> (\n" +
				"g8. ) [ e16 ( d8. ) b16 ] ( \\downbow | % 7\n" +
				"a2 \\! ) d,8 ( \\upbow e8 fs8 a8 ) | % 8",
			),
			false,
			"increment by more than one",
		},
		{
			[]string{
				"g8. [ \\mf \\downbow a16 ( \\upbow g8. ) a16 ] (",
				"b8. ) [ d16 ( e8. ) d16 ( ] \\downbow | % 2",
				"g8. [ \\< ) fs16 ( a8. ) g16 ] (",
				"fs8. ) [ a16 ( g8. ) e16 ] ( \\downbow | % 3",
				"d8. ) [ d16 ( e8. ) d16 ] \\> (",
				"g8. ) [ e16 ( d8. ) b16 ] ( \\downbow | % 4",
				"a2 \\! ) d,8 ( \\upbow e8 fs8 a8 ) | % 5",
			},
			1,
			1,
			30,
			nil,
			true,
			"go beyond end of file",
		},
		{
			[]string{
				"g8. [ \\mf \\downbow a16 ( \\upbow g8. ) a16 ] (",
				"b8. ) [ d16 ( e8. ) d16 ( ] \\downbow | % 2",
				"g8. [ \\< ) fs16 ( a8. ) g16 ] (",
				"fs8. ) [ a16 ( g8. ) e16 ] ( \\downbow | % 3",
				"d8. ) [ d16 ( e8. ) d16 ] \\> (",
				"g8. ) [ e16 ( d8. ) b16 ] ( \\downbow | % 4",
				"a2 \\! ) d,8 ( \\upbow e8 fs8 a8 ) | % 5",
			},
			1,
			-15,
			2,
			nil,
			true,
			"first line less than one",
		},
		{
			[]string{
				"g8. [ \\mf \\downbow a16 ( \\upbow g8. ) a16 ] (",
				"b8. ) [ d16 ( e8. ) d16 ( ] \\downbow | % 2",
				"g8. [ \\< ) fs16 ( a8. ) g16 ] (",
				"fs8. ) [ a16 ( g8. ) e16 ] ( \\downbow | % 3",
				"d8. ) [ d16 ( e8. ) d16 ] \\> (",
				"g8. ) [ e16 ( d8. ) b16 ] ( \\downbow | % 4",
				"a2 \\! ) d,8 ( \\upbow e8 fs8 a8 ) | % 5",
			},
			1,
			1,
			-2,
			nil,
			true,
			"last line less than one",
		},
		{
			[]string{
				"g8. [ \\mf \\downbow a16 ( \\upbow g8. ) a16 ] (",
				"b8. ) [ d16 ( e8. ) d16 ( ] \\downbow | % 2",
				"g8. [ \\< ) fs16 ( a8. ) g16 ] (",
				"fs8. ) [ a16 ( g8. ) e16 ] ( \\downbow | % 3",
				"d8. ) [ d16 ( e8. ) d16 ] \\> (",
				"g8. ) [ e16 ( d8. ) b16 ] ( \\downbow | % 4",
				"a2 \\! ) d,8 ( \\upbow e8 fs8 a8 ) | % 5",
			},
			1,
			4,
			2,
			nil,
			true,
			"last line less than first line",
		},
	}
	for _, testCase := range testCases {
		actualBytes, err := AssembleFile(testCase.inLines, testCase.increment,
			testCase.firstLine, testCase.lastLine)
		if err != nil {
			if testCase.expectErr {
				continue
			} else {
				t.Errorf("Error '%s' was raised when none was expected.\n"+
					"test: %s", err, testCase.description)
			}
		}
		if !reflect.DeepEqual(actualBytes, testCase.expectedBytes) {
			differences := []string{"Actual\t---\tExpected"}
			for i, actualByte := range actualBytes {
				if actualByte != testCase.expectedBytes[i] {
					difference := "..." + string(actualBytes[i-30:i+1]) + "\t---\t" +
						string(testCase.expectedBytes[i-30:i+1])
					differences = append(differences, difference)
				}
			}
			differenceString := strings.Join(differences, "\n")
			t.Errorf("Actual bytes are not as expected in test %s. Differences follow\n%v",
				testCase.description, differenceString)
		}
	}
}

func TestDoEverything(t *testing.T) {
	tmpDir, err := ioutil.TempDir("", "testOut")
	tmpFile := path.Join(tmpDir, "testOutFile.ily")
	defer os.RemoveAll(tmpDir)
	if err != nil {
		log.Fatal(fmt.Sprintf("Could not write temporary file for testing, %s", err))
	}
	ProcessFile(2, true, 21, 150, false, tmpFile, []string{"testdata/testInFile.ily"})
	defer os.Remove("testdata/testInFile.ily.bak")
	expectedContent, err := ioutil.ReadFile("testdata/testOutFile.ily")
	if err != nil {
		log.Fatal(fmt.Sprintf("Could not open test data: %s", err))
	}
	actualContent, err := ioutil.ReadFile(tmpFile)
	if err != nil {
		t.Errorf("Could not open output file: %s", err)
	}
	if !reflect.DeepEqual(expectedContent, actualContent) {
		t.Errorf("Output file does not match expected content.")
	}
}
