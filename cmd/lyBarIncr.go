// Package lyBarIncr contains the important functions for lybarincr
package cmd

import (
	"fmt"
	"io/ioutil"
	"log"
	"strconv"
	"strings"
)

//newContent := assembleFile(lines, increment, firstLine, 200)
//return nil

//err := ioutil.WriteFile("violin_solo_1_processed.ily", newContent, 0644)
//if err != nil {
//  log.Fatal(err)
//}
//}

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
	if firstLine < 1 {
		return nil, fmt.Errorf("Error: First line must be greater than 1.")
	}
	if lastLine > len(lines) {
		return nil, fmt.Errorf("Error: Last line (%d) is beyond end of file. (%d)", lastLine, len(lines))
	}
	var newLines []string
	i := 1
	for _, line := range lines {
		if i >= firstLine && i <= lastLine {
			newLines = append(newLines, IncrementBarNum(line, increment))
		} else {
			newLines = append(newLines, line)
		}
		i += 1
	}
	newLinesStream := strings.Join(newLines, "\n")
	return []byte(newLinesStream), nil
}
