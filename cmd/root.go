// Package rootCmd is the root command for lilypond bar number incrementer
package cmd

import (
	"errors"
	"fmt"
	"github.com/spf13/cobra"
	"io/ioutil"
	"log"
	"os"
)

var rootCmd = &cobra.Command{
	Use:   "lybarincr [flags] FILENAME",
	Short: "lybarincr repairs bar number errors in lilypond files.",
	Long: `Increment or decrement every bar number check or comment by
a specified amount over a certain range of lines in a file, and backs
up the original file`,
	Args: func(c *cobra.Command, args []string) error {
		if len(args) < 1 {
			return errors.New("Filename is required.")
		}
		if len(args) > 1 {
			return errors.New("One file at a time.")
		}
		_, err := os.Stat(args[0])
		if err == nil {
			return nil
		}
		return fmt.Errorf("Cannot stat file: %s", args[0])
	},

	Run: func(cmd *cobra.Command, args []string) {
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
	},
}

var increment int64
var decrement bool
var firstLine int
var lastLine int
var dryRun bool
var outFile string

func init() {
	rootCmd.Flags().Int64VarP(&increment, "increment", "i", 1, "Specify increment Value")
	rootCmd.Flags().BoolVarP(&decrement, "decrement", "d", false, "Decrement instead of incrementing.")
	rootCmd.Flags().IntVarP(&firstLine, "first-line", "f", 1, "Specify first line number (inclusive), defaults to start of file.")
	rootCmd.Flags().IntVarP(&lastLine, "last-line", "l", -1, "Specify last line number (inclusive), defaults to end of file.")
	rootCmd.Flags().BoolVarP(&dryRun, "dry-run", "n", false, "Write result to stdout without overwriting input file.")
	rootCmd.Flags().StringVarP(&outFile, "output", "o", "", "Output file. Defaults to overwriting input file. A backup will be created either way.")
}

func Execute() {
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
