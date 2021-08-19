# Grading for 13

| Task                                     |   Points |
| ---------------------------------------- | --------:|
| 13/shellcheck.sh                         |       30 |
| 13/command.txt                           |       20 |
| 13/volume.txt                            |       20 |
| 13/port.txt                              |       20 |
| **Total**                                |   **90** |


Text below contains more details. If you provided a troublefree solution or
a correct answer, more detailed comments are often not provided as they are
not needed.

If you encounter an issue such as wrong comment, missing points, overlooked
answer etc., please, fill-in a _Confidential_ Issue at the
[Forum](https://gitlab.mff.cuni.cz/teaching/nswi177/2021-summer/common/forum/)
and we will have a look. Please, specify task name (e.g. 01/longest.py) in
the Issue title.

Commit: ede485c92e78e1f61f90e6e5717176c21c5064ca


## 📘 13/shellcheck.sh

### ✅ 13/shellcheck.sh - Submitted (informative test only)

Test passed.

### ✅ 13/shellcheck.sh - Proper shebang

Test passed.

### ✅ 13/shellcheck.sh - Executable bit

Test passed.

### ✅ 13/shellcheck.sh - ShellChecked - style (informative test only)

Test passed.

### ✅ 13/shellcheck.sh - ShellChecked - notes

Test passed.

### ✅ 13/shellcheck.sh - ShellChecked - warnings

Test passed.

### ✅ 13/shellcheck.sh - Check tempfile clean-up

Check that temporary files are properly removed.

Test passed.

### ✅ 13/shellcheck.sh - Check proper tempfiles are used

Checks that the implementation does not remove files
in the current directory by using hard-coded paths instead of using
`mktemp`. Note that any hard-coded filename is vulnerable to
concurrent execution issues.

Test passed.

### ❌ 13/shellcheck.sh - Works when all scripts are fine

```
-- command failed --
status : 1
output (22 lines):
  In 03/tests.txt line 5:
  cd __tests
  ^--------^ SC2164: Use 'cd ... || exit' or 'cd ... || return' in case cd fails.
  Did you mean:
  cd __tests || exit
  In 03/tests.txt line 8:
  cd ..
  ^---^ SC2103: Use a ( subshell ) to avoid having to cd back.
  In 03/tests.txt line 13:
  then creates new __tests directory
  ^-- SC1089: Parsing stopped here. Is this keyword correctly matched up?
  For more information:
    https://www.shellcheck.net/wiki/SC2164 -- Use 'cd ... || exit' or 'cd ... |...
    https://www.shellcheck.net/wiki/SC2103 -- Use a ( subshell ) to avoid havin...
    https://www.shellcheck.net/wiki/SC1089 -- Parsing stopped here. Is this key...
--
```

### ✅ 13/shellcheck.sh - Works when some scripts contains errors

Test passed.

### ✅ 13/shellcheck.sh - Works when some scripts contains warnings

Test passed.

### ✅ 13/shellcheck.sh - Works when some scripts contains style issues (informative test only)

Test passed.

### ✅ 13/shellcheck.sh - Outputs the names of files with issues (informative test only)

Test passed.

### ✅ 13/shellcheck.sh - GitLab pipeline exists

Pipeline contains string shellcheck exists

Test passed.

### ✅ 13/shellcheck.sh - Job 'shellcheck' in the pipelines

Test passed.

### ❌ 13/shellcheck.sh - GitLab pipeline passes (informative test only)

```
-- output differs --
expected : success
actual   : failed
--
```

## 📘 13/command.txt

### ✅ 13/command.txt - Submitted (informative test only)

Test passed.

### ✅ 13/command.txt - Correct answer

Test passed.

## 📘 13/volume.txt

### ✅ 13/volume.txt - Submitted (informative test only)

Test passed.

### ✅ 13/volume.txt - Correct first string

Test passed.

### ✅ 13/volume.txt - Correct second string

Test passed.

## 📘 13/port.txt

### ✅ 13/port.txt - Submitted (informative test only)

Test passed.

### ✅ 13/port.txt - Correct answer

Test passed.

