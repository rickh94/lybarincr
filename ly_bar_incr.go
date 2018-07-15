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
	content, err := ioutil.ReadFile("violin_solo_1.ily")
	if err != nil {
		log.Fatal(err)
	}
	//fmt.Printf("File contents: %s", content)
	lines := strings.SplitAfter(string(content), "\n")
	i := 1
	for _, line := range lines {
		if 20 < i && i < 80 {
			fmt.Printf("%d: %v", i, line)
			newLine := incrementBarNum(line, 1)
			fmt.Println(newLine)
		}
		i += 1
	}
	//err = ioutil.WriteFile("violin_solo_1_copy.ily", content, 0644)
	if err != nil {
		log.Fatal(err)
	}
}

// Function incr_bar_num takes a line and increment value and returns the line with the
// bar number incremented to that value
func incrementBarNum(line string, increment int64) string {
	//var newLine string
	var delimiter string
	if strings.Contains(line, "\\barNumberCheck #") {
		delimiter = "#"
	} else if strings.Contains(line, "%") {
		delimiter = "%"
	} else {
		return line
	}
	parts := strings.SplitAfter(strings.Trim(line, "\n"), delimiter)
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
	parts = append(parts[:len(parts)-1], extraSpace, strconv.FormatInt(newBarNum, 10), "\n")
	return strings.Join(parts, "")
}
