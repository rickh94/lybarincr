# lybarincr

![build status](https://travis-ci.org/rickh94/lybarincr.svg?branch=master)
Simple script to increment bar numbers in comments and number checks in lilypond files.

## Usage
Increment or decrement every bar number check or comment by
a specified amount over a certain range of lines in a file, and backs
up the original file

Usage:
  lybarincr [flags] FILENAME

Flags:
  -d, --decrement        Decrement instead of incrementing.
  -n, --dry-run          Write result to stdout without overwriting input file.
  -f, --first-line int   Specify first line number (inclusive), defaults to start of file. (default 1)
  -h, --help             help for lybarincr
  -i, --increment int    Specify increment Value (default 1)
  -l, --last-line int    Specify last line number (inclusive), defaults to end of file. (default -1)
  -o, --output string    Output file. Defaults to overwriting input file. A backup will be created either way.
                   [-l LAST_LINE] [-n]
                   FILE

Increment bar numbers in comments and bar number checks of a lilypond file.

| Argument | Description |
|----------|-------------|
| FILE     | __REQUIRED__:  specify input file |
|-h, --help | Show this help message and exit |
|-i INCREMENT_VALUE, --increment-value INCREMENT_VALUE| Specify number to increment by. Defaults to 1.|
|-d, --decrement | Decrement instead of incrementing. |
|-f FIRST_LINE, --first-line FIRST_LINE | Specify first line (inclusive) to increment on. Default to start of file.|
|-l LAST_LINE, --last-line LAST_LINE | Specify last line (inclusive) to increment on. Defaults to end of file.|
|-n, --dry-run | Write result to stdout without affecting input file |
