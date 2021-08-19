# Grading for 04

| Task                                     |   Points |
| ---------------------------------------- | --------:|
| 04/seq                                   |       20 |
| 04/uid_sum.sh                            |       15 |
| 04/pass_gen.sh                           |       10 |
| 04/run_in_dir.bats                       |       10 |
| 04/longest_line                          |       10 |
| 04/matrix_slice.sh                       |       15 |
| 04/row_sum.sh                            |       20 |
| **Total**                                |  **100** |


Text below contains more details. If you provided a troublefree solution or
a correct answer, more detailed comments are often not provided as they are
not needed.

If you encounter an issue such as wrong comment, missing points, overlooked
answer etc., please, fill-in a _Confidential_ Issue at the
[Forum](https://gitlab.mff.cuni.cz/teaching/nswi177/2021-summer/common/forum/)
and we will have a look. Please, specify task name (e.g. 01/longest.py) in
the Issue title.

Commit: a6d5fac6531fad26635dbeff6576cfc3effad5a0


## 📘 04/seq

### ✅ 04/seq.py - Shebang

Checks that correct Python shebang is used

Test passed.

### ✅ 04/seq.py - Executable

Checks that file has executable (chmod +x) bit set.

Test passed.

### ✅ 04/seq.py - Uses __name__ == __main__ check

Checks that Python idiom for proper modularization is used.

Test passed.

### ✅ 04/seq.py - Run without arguments

Run without any arguments.

Test passed.

### ✅ 04/seq.py - Run with abc

Test passed.

### ✅ 04/seq.py - Run with zero step

Test passed.

### ✅ 04/seq.py - Run with 1 2 3 4

Run with more than three arguments.

Test passed.

### ✅ 04/seq.py - with inf

Run with inf argument.

Test passed.

### ✅ 04/seq.py - with True

Run with True argument.

Test passed.

### ✅ 04/seq.py - Run with 5

Test passed.

### ✅ 04/seq.py - Run with -5

Test passed.

### ✅ 04/seq.py - Run with -5 5

Test passed.

### ✅ 04/seq.py - Run with 3 5 42

Test passed.

### ✅ 04/seq.py - Run with 3 8 6

Test passed.

### ✅ 04/seq.py - Run with 3 -5 42

Test passed.

### ✅ 04/seq.py - Run with 42 -5 3

Test passed.

### ✅ 04/seq.py - Run with 1 5 -2

Test passed.

### ✅ 04/seq.py - Run with +5

Run one numerical argument with foregoing plus sign.

Test passed.

### ✅ 04/seq.py - Run with expression

Run Python expression.

Test passed.

### ✅ 04/seq.py - Run with -10 3 8

Test passed.

### ✅ 04/seq.py - Run with 8 -3 -10

Test passed.

### ✅ 04/seq.py - Run with 0 1024

Test passed.

### ✅ 04/seq.py - Run with -10000 2 10000

Test passed.

## 📘 04/uid_sum.sh

### ✅ 04/uid_sum.sh - Shebang

Checks that the script is really a shellscript

Test passed.

### ✅ 04/uid_sum.sh - Executable

Checks that the executable bit is set

Test passed.

### ✅ 04/uid_sum.sh - Works on current /etc/passwd

Checks the script works on system /etc/passwd.

Test passed.

### ✅ 04/uid_sum.sh - Works on Rotunda /etc/passwd

Test passed.

### ✅ 04/uid_sum.sh - Uses control flow

Checking that you have used pipes and not loops.

Test passed.

### ✅ 04/uid_sum.sh - Uses advanced utilities

Checking that you have used shell and not Python or PERL.

Test passed.

## 📘 04/pass_gen.sh

### ✅ 04/pass_gen.sh - Shebang

Checks that the script is really a shellscript

Test passed.

### ✅ 04/pass_gen.sh - Executable

Checks that the executable bit is set

Test passed.

### ✅ 04/pass_gen.sh - Unique outputs on 20 invocations

Script should return unique output on each of 20 invocations.

Test passed.

### ✅ 04/pass_gen.sh - Output line format

Output line should be in the correct format.

Test passed.

### ✅ 04/pass_gen.sh - End of line

There should be end-of-line character at the end of output.

Test passed.

## 📘 04/run_in_dir.bats

Nice and simple.

### ✅ 04/run_in_dir.sh - Shebang

Checks that the script is really a shellscript

Test passed.

### ✅ 04/run_in_dir.sh - Executable

Checks that the executable bit is set

Test passed.

### ✅ 04/run_in_dir.sh - Switches directories (informative test only)

Checks that the script really switches to the directory. This
was the intended point of the exercise

Test passed.

### ✅ 04/run_in_dir.sh - Works when the directory contains the file

Checks that the script works when the file 01/input.txt does exist

Test passed.

### ✅ 04/run_in_dir.sh - Works when the directory does not contain the file

Checks that the script works when only the directory exists

Test passed.

### ✅ 04/run_in_dir.sh - Works when the directory does not exist

Checks that the script works when the directory 01 does not exist

Test passed.

### ✅ 04/run_in_dir.sh - Works when called from a different directory

Checks that the script works when called differently from './run_in_dir.sh'

Test passed.

### ✅ 04/run_in_dir.sh - Doesn't use control flow

Checks that the script doesn't use forbidden control flow ('if' etc.)

Test passed.

### ✅ 04/run_in_dir.sh - Doesn't use advanced utilities

Checks that the script doesn't use advanced 'non-shell' utilities like
python or awk.

Test passed.

## 📘 04/longest_line

### ✅ 04/longest_line.sh - submitted (informative test only)

Test passed.

### ✅ 04/longest_line.sh - Executable

Checks that file has executable (chmod +x) bit set.

Test passed.

### ✅ 04/longest_line.sh - Shebang

Checks that correct bash shebang is used

Test passed.

### ✅ 04/longest_line.sh - Not the longest line of the file

Longest line in the whole file is not in the first 15 lines.

Test passed.

### ✅ 04/longest_line.sh - Longest line is the third one

Test passed.

### ✅ 04/longest_line.sh - Many empty lines

The README is formed by mostly empty lines

Test passed.

## 📘 04/matrix_slice.sh

### ✅ 04/matrix_slice.sh - Submitted (informative test only)

Test passed.

### ✅ 04/matrix_slice.sh - Shebang

Checks that the script is really a shellscript

Test passed.

### ✅ 04/matrix_slice.sh - Executable

Checks that the executable bit is set

Test passed.

### ✅ 04/matrix_slice.sh - Provided matrix

Checks that the script works on the provided matrix.

Test passed.

### ✅ 04/matrix_slice.sh - Provided matrix, relaxed

Relaxed version ignoring white-space issues

Test passed.

### ✅ 04/matrix_slice.sh - Matrix two

Test passed.

### ✅ 04/matrix_slice.sh - Matrix two, relaxed

Relaxed version ignoring white-space issues

Test passed.

### ✅ 04/matrix_slice.sh - Matrix three

Test passed.

### ✅ 04/matrix_slice.sh - Matrix three, relaxed

Relaxed version ignoring white-space issues

Test passed.

### ✅ 04/matrix_slice.sh - Shell control flow structures

Checking that you have used pipes and not loops.

Test passed.

## 📘 04/row_sum.sh

### ✅ 04/row_sum.sh - Shebang

Checks whether correct shebang is present

Test passed.

### ✅ 04/row_sum.sh - Executable

Checks whether the executable bit is set

Test passed.

### ✅ 04/row_sum.sh - Standard input matrix

Test passed.

### ✅ 04/row_sum.sh - One row matrix

Test passed.

### ✅ 04/row_sum.sh - One column matrix

Test passed.

### ✅ 04/row_sum.sh - One element matrix

Test passed.

