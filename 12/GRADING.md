# Grading for 12

| Task                                     |   Points |
| ---------------------------------------- | --------:|
| 12/Makefile                              |       98 |
| **Total**                                |   **98** |


Text below contains more details. If you provided a troublefree solution or
a correct answer, more detailed comments are often not provided as they are
not needed.

If you encounter an issue such as wrong comment, missing points, overlooked
answer etc., please, fill-in a _Confidential_ Issue at the
[Forum](https://gitlab.mff.cuni.cz/teaching/nswi177/2021-summer/common/forum/)
and we will have a look. Please, specify task name (e.g. 01/longest.py) in
the Issue title.

Commit: d412d5e82e93f677e7ccb0d95259f8d7143457d8


## 📘 12/Makefile

### ✅ 12/Makefile - submitted (informative test only)

Test passed.

### ✅ 12/Makefile - Generated files not committed

Test passed.

### ✅ 12/Makefile - Set-up - Base

Test passed.

### ✅ 12/Makefile - Set-up - Incremental build

Test passed.

### ✅ 12/Makefile - Set-up - clean target

Test passed.

### ✅ 12/Makefile - Generation of rules.odt - Base

Test passed.

### ✅ 12/Makefile - Generation of rules.odt - Incremental build

Test passed.

### ✅ 12/Makefile - Generation of rules.odt - Menu item

Test passed.

### ✅ 12/Makefile - Task-related files generation - Base

Test passed.

### ✅ 12/Makefile - Task-related files generation - Incremental build

Test passed.

### ✅ 12/Makefile - Task-related files generation - tasks.html file

Test passed.

### ✅ 12/Makefile - Task-related files generation - Menu item

Test passed.

### ✅ 12/Makefile - Task-related files generation - New task added

Test passed.

### ✅ 12/Makefile - Generation of a scoring table - Base

Test passed.

### ✅ 12/Makefile - Generation of a scoring table - Incremental build

Test passed.

### ✅ 12/Makefile - Generation of a scoring table - Menu entry (informative test only)

Test passed.

### ✅ 12/Makefile - Generation of a scoring table - Table content

Test passed.

### ✅ 12/Makefile - Generation of a scoring table - Table content with new task

Created tasks/three.md and run make 'TASKS=one two three'.

Test passed.

### ✅ 12/Makefile - Generation of a scoring table - Table content with new team

Test passed.

### ❌ 12/Makefile - Code smells - Hardcoded input file paths (informative test only)

Paths shall be kept at one place - preferably inside Makefile. Scripts should receive their names via sys.args.

```
Following files contain hard-coded paths to either score.csv or teams.csv
12/bin/mk_score_html.sh
```

### ❌ 12/Makefile - Code smells - Hardcoded output file paths (informative test only)

Paths shall be kept at one place - preferably inside Makefile. Scripts should receive their names via sys.args or print to stdout.

```
Following files contain hard-coded paths to the output directory
12/bin/create_task_html.sh
```

### ✅ 12/Makefile - Code smells - Python __main__

Test passed.

### ❌ 12/Makefile - Code smells - Shellcheck

```
-- Shellcheck report --
12/bin/mk_score_html.sh:38:40: note: Make sure not to read and write the same file in the same pipeline. [SC2094]
12/bin/mk_score_html.sh:47:7: note: Make sure not to read and write the same file in the same pipeline. [SC2094]
--
```

