// Package rootCmd is the root command for lilypond bar number incrementer
package cmd

import (
	"errors"
	"fmt"
	"github.com/spf13/cobra"
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
		ProcessFile(incrementOpt, decrementOpt, firstLineOpt, lastLineOpt, dryRunOpt, outFileOpt, args)
	},
}

var incrementOpt int64
var decrementOpt bool
var firstLineOpt int
var lastLineOpt int
var dryRunOpt bool
var outFileOpt string

func init() {
	rootCmd.Flags().Int64VarP(&incrementOpt, "increment", "i", 1, "Specify increment Value")
	rootCmd.Flags().BoolVarP(&decrementOpt, "decrement", "d", false, "Decrement instead of incrementing.")
	rootCmd.Flags().IntVarP(&firstLineOpt, "first-line", "f", 1, "Specify first line number (inclusive), defaults to start of file.")
	rootCmd.Flags().IntVarP(&lastLineOpt, "last-line", "l", -1, "Specify last line number (inclusive), defaults to end of file.")
	rootCmd.Flags().BoolVarP(&dryRunOpt, "dry-run", "n", false, "Write result to stdout without overwriting input file.")
	rootCmd.Flags().StringVarP(&outFileOpt, "output", "o", "", "Output file. Defaults to overwriting input file. A backup will be created either way.")
}

func Execute() {
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
