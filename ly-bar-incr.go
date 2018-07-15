// Package main is the primary code for ly_bar_incr implemented in golang.
package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"strconv"
	"strings"
)

func main() {
	//content, err := ioutil.ReadFile("violin_solo_1.ily")
	//if err != nil {
	//  log.Fatal(err)
	//}
	//fmt.Printf("File contents: %s", content)
	lines := readLilypondFile("violin_solo_1.ily")
	i := 1
	for _, line := range lines {
		if 20 < i && i < 80 {
			fmt.Printf("%d: %v\n", i, line)
			newLine := incrementBarNum(line, 1)
			fmt.Println(newLine)
		}
		i += 1
	}
	newContent := assembleFile(lines, 1, 20, 80)
	err := ioutil.WriteFile("violin_solo_1_processed.ily", newContent, 0644)
	//err = ioutil.WriteFile("violin_solo_1_copy.ily", content, 0644)
	if err != nil {
		log.Fatal(err)
	}
}

// Function readLilypondFile reads the input lilypond file and returns the lines
func readLilypondFile(path string) []string {
	content, err := ioutil.ReadFile(path)
	if err != nil {
		fmt.Println("Could not open file")
		log.Fatal(err)
	}
	backupPath := strings.Join([]string{path, ".bak"}, "")
	err = ioutil.WriteFile(backupPath, content, 644)
	if err != nil {
		fmt.Println("Could not write backup")
		log.Fatal(err)
	}
	return strings.Split(string(content), "\n")
}

// Function incr_bar_num takes a line and increment value and returns the line with the
// bar number incremented to that value
func incrementBarNum(line string, increment int64) string {
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
func assembleFile(lines []string, increment int64, firstLine int, lastLine int) []byte {
	var newLines []string
	i := 1
	for _, line := range lines {
		if i >= firstLine && i <= lastLine {
			newLines = append(newLines, incrementBarNum(line, increment))
		} else {
			newLines = append(newLines, line)
		}
		i += 1
	}
	newLinesStream := strings.Join(newLines, "\n")
	return []byte(newLinesStream)
}
