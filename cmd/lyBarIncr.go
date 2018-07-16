// Package lyBarIncr contains the important functions for lybarincr
package cmd

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"strconv"
	"strings"
)

// Function readLilypondFile reads the input lilypond file and returns the lines
func ReadLilypondFile(path string) ([]string, error) {
	content, err := ioutil.ReadFile(path)
	if err != nil {
		return nil, fmt.Errorf("Could not open file %v", path)
	}
	backupPath := strings.Join([]string{path, ".bak"}, "")
	err = ioutil.WriteFile(backupPath, content, 0644)
	if err != nil {
		return nil, fmt.Errorf("Could not write backup file: %v", backupPath)
	}
	return strings.Split(string(content), "\n"), nil
}

// Function incr_bar_num takes a line and increment value and returns the line with the
// bar number incremented to that value
func IncrementBarNum(line string, increment int64) string {
	// select the delimiter to split on depending on whether the bar number is
	// a check or comment
	var delimiter string
	if strings.Contains(line, "\\barNumberCheck #") {
		delimiter = "#"
	} else if strings.Contains(line, "%") {
		delimiter = "%"
	} else {
		return line
	}

	// split the line, convert and increment the number
	parts := strings.SplitAfter(line, delimiter)
	numAsString := parts[len(parts)-1]
	extraSpace := "" // if a space is stripped, a space needs to be added back in, if not, not
	if strings.Contains(numAsString, " ") {
		numAsString = strings.Trim(numAsString, " ")
		extraSpace = " "
	}
	barNum, err := strconv.ParseInt(numAsString, 10, 64)
	if err != nil {
		log.Fatal(err)
	}
	newBarNum := barNum + increment

	// reassemble the line into a slice
	parts = append(parts[:len(parts)-1], extraSpace, strconv.FormatInt(newBarNum, 10))
	// join the slice and return the new line
	return strings.Join(parts, "")
}

// Function assembleFile takes the lines from a file, the increment, and line number range,
// increments the appropriate lines, and then returns the new file bytes
func AssembleFile(lines []string, increment int64, firstLine int, lastLine int) ([]byte, error) {
	if firstLine < 1 || lastLine < 1 {
		return nil, fmt.Errorf("Error: Line numbers must be greater than 1.")
	}
	if lastLine > len(lines) {
		return nil, fmt.Errorf("Error: Last line (%d) is beyond end of file. (%d)", lastLine, len(lines))
	}
	if lastLine < firstLine {
		return nil, fmt.Errorf("Error: Last line must be after first line")
	}
	var newLines []string
	for i, line := range lines {
		lineNum := i + 1
		if lineNum >= firstLine && lineNum <= lastLine {
			newLines = append(newLines, IncrementBarNum(line, increment))
		} else {
			newLines = append(newLines, line)
		}
	}
	newLinesStream := strings.Join(newLines, "\n")
	return []byte(newLinesStream), nil
}

// Function ProcessFile does all the handling of arguments and writing out the final file
func ProcessFile(increment int64, decrement bool, firstLine int, lastLine int, dryRun bool, outFile string, args []string) {
	// switch to decrementing if needed
	if decrement {
		increment = -increment
	}
	inFile := args[0]
	lines, err := ReadLilypondFile(inFile)
	if err != nil {
		log.Fatal(err)
	}
	// make sure the whole file is done if not specified
	if lastLine < 0 {
		lastLine = len(lines)
	}
	newContent, err := AssembleFile(lines, increment, firstLine, lastLine)
	if err != nil {
		log.Fatal(err)
	}
	if dryRun {
		fmt.Printf("%s", newContent)
	} else {
		if outFile == "" {
			outFile = inFile
		}
		info, err := os.Stat(inFile)
		if err != nil {
			log.Fatal(err)
		}
		err = ioutil.WriteFile(outFile, newContent, info.Mode())
		if err != nil {
			log.Fatal(err)
		}
		fmt.Printf("%s has been written. Original is available at %s.bak\n", outFile, inFile)
	}
}
