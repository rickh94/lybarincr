package cmd

import (
	"io/ioutil"
	"log"
	"os"
	"path"
	"reflect"
	"testing"
)

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
	// tests
	testFiles := []struct {
		path          string
		expectedLines []string
		expectErr     bool
		name          string
	}{
		{
			"../testdata/testfile1.dat",
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
