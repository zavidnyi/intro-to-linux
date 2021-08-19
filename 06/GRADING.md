# Grading for 06

| Task                                     |   Points |
| ---------------------------------------- | --------:|
| 06/remote_file                           |       20 |
| 06/upload_our_key                        |       20 |
| 06/forced_command                        |       30 |
| 06/key_pub                               |       15 |
| 06/machine_status.sh                     |       13 |
| **Total**                                |   **98** |


Text below contains more details. If you provided a troublefree solution or
a correct answer, more detailed comments are often not provided as they are
not needed.

If you encounter an issue such as wrong comment, missing points, overlooked
answer etc., please, fill-in a _Confidential_ Issue at the
[Forum](https://gitlab.mff.cuni.cz/teaching/nswi177/2021-summer/common/forum/)
and we will have a look. Please, specify task name (e.g. 01/longest.py) in
the Issue title.

Commit: 3b97957cf9e8ec991a53516971a35556ac1c0546


## 📘 06/remote_file

### ✅ 06/Remote file - file present

Checks if ~/LAB06 exists.

Test passed.

### ✅ 06/Remote file - correct content

Checks if ~/LAB06 contains only student id.

Test passed.

## 📘 06/upload_our_key

### ✅ 06/Upload our key

Checks that SSH with our key works

Test passed.

## 📘 06/forced_command

### ✅ 06/forced_command - root date

Check that date command works for root.

Test passed.

### ✅ 06/forced_command - root stat

Check that stat command works for root.

Test passed.

### ✅ 06/forced_command - root csv header

Check that csv command for root contains a csv header.

Test passed.

### ✅ 06/forced_command - root csv data

Check that csv command for root contains root data.

Test passed.

### ✅ 06/forced_command - root csv complex

Check that csv command works for root with date command from other users.

Test passed.

### ✅ 06/forced_command - bob csv

Check that bob isn't allowed to call csv command.

Test passed.

### ✅ 06/forced_command - unknown command

Check that unknown command fails or outputs some message.

Test passed.

### ✅ 06/forced_command - single script

Check that the assignment uses single script for all pseudo users.

Test passed.

### ❌ 06/forced_command - unknown command conventional behaviour (informative test only)

Check that unknown command fails, and outputs an error to stderr.

```
-- standard output is not empty --
output : Invalid command.
--
```

## 📘 06/key_pub

### ✅ 06/key.pub - file present (informative test only)

Test passed.

### ✅ 06/key.pub - correct public key

Checks that /bin/file treats the file as OpenSSH public key file

Test passed.

### ✅ 06/key.pub - reasonable permissions

Checks that the key file is not executable

Test passed.

## 📘 06/machine_status.sh

### ✅ 06/machine_status.sh - Submitted (informative test only)

Test passed.

### ✅ 06/machine_status.sh - Proper shebang

Test passed.

### ✅ 06/machine_status.sh - Executable bit

Test passed.

### ✅ 06/machine_status.sh - ShellChecked - style [info only] (informative test only)

Test passed.

### ✅ 06/machine_status.sh - ShellChecked - notes

Test passed.

### ✅ 06/machine_status.sh - ShellChecked - warnings

Test passed.

### ❌ 06/machine_status.sh - Check tempfile clean-up

Check that temporary files are properly removed.

```
-- following temporary files were not removed (names were cleaned-up) --
/tmp/tmp.0000000001 (regular empty file, 0 bytes)
/tmp/tmp.0000000002 (regular file, 148 bytes)
/tmp/tmp.0000000003 (regular file, 148 bytes)
--
```

### ✅ 06/machine_status.sh - Check proper tempfiles are used

Checks that the implementation does not remove files
in the current directory by using hard-coded paths instead of using
`mktemp`. Note that any hard-coded filename is vulnerable to
concurrent execution issues.

Test passed.

### ✅ 06/machine_status.sh - Does not use SCP or SSH to retrieve the file

You cannot use SSH inside a script that would be run without knowledge of your key (and you should NEVER store a key in a repository unless it is encrypted)

Test passed.

### ✅ 06/machine_status.sh - With --help

Test passed.

### ✅ 06/machine_status.sh - Default data

Run with default data

Test passed.

### ✅ 06/machine_status.sh - Default data with --silent

Run with default data

Test passed.

### ✅ 06/machine_status.sh - Run with -i on correct file

Test passed.

### ✅ 06/machine_status.sh - Run with -i on non-existent file

Test passed.

### ✅ 06/machine_status.sh - Filtering for alpha

Test passed.

### ✅ 06/machine_status.sh - Filtering for nonexistent machine

Test passed.

### ✅ 06/machine_status.sh - Filtering with complex regex

Filtering for worker0[0-3] from the following file:

```
worker01.example.d3s.mff.cuni.cz:System is up-to-date:0
worker02.example.d3s.mff.cuni.cz:System is up-to-date:0
worker03.example.d3s.mff.cuni.cz:System is up-to-date:0
worker04.example.d3s.mff.cuni.cz:System is up-to-date:1
```

Test passed.

### ❌ 06/machine_status.sh - Input file missing (informative test only)

Checks that script terminates with 102 when the default file /srv/nswi177/machine.status does not exist.

```
-- Unexpected exit code --
expected : 102
actual   : 1
--
```

