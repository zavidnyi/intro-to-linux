# Basic concepts rehearsal

Please, answer briefly but correctly.

Simplification is fine as long as it does not contradict actual
technical implementation.

## Q1: Processes and executable files (10 points)

Explain the difference between an executable file
(e.g., `/usr/bin/env`) and a process (e.g., PID 8147).

**[A1]** Executable file is a source code which can be run while the process is an instance of that source code which is currently being run **[/A1]**


## Q2: stdin vs argv (15 points)

Explain the differences beetween following two invocations.

```shell
cat file.txt
cat <file.txt
```

Focus on the programming side of the problem.
That includes explanation of who (in the sense of an executable/process)
opens the file and when, who checks for file existence, what data types
are used (e.g., a file handle or a string).

**[A2]** In the first variant we pass file as a string argv to a string which cat will try to open and report about it if it fails to do so. In the second variant shell will handle opening the file and reporting any erros connected to it, while cat will read its contents from stdin. Note that we cannot pass more the 1 file with the second variant which destroys the original purpose of cat :). **[/A2]**


## Working directory concept (15 points)

Assuming following file organization.

```
/alpha/RUN.sh
/bravo/data.txt
/charlie/data.txt
/delta/data.txt
/delta/alpha/data.txt
```

For the following invocations, always provide an _absolute_
path of the file the script will work with.

For example, when the invocation is `/alpha/RUN.sh /charlie/data.txt`,
the answer is `/charlie/data.txt`.

Note that the implementation of `RUN.sh` contains only the following.

    cat "$1"


**Q3**

```shell
/alpha/RUN.sh /alpha/../alpha/data.txt
```

**[A3]** /alpha/data.txt **[/A3]**


**Q4**

```shell
cd /bravo/ && ../alpha/RUN.sh data.txt
```

**[A4]** /bravo/data.txt **[/A4]**



**Q5**

```shell
cd /delta && /alpha/RUN.sh alpha/data.txt
```

**[A5]** /delta/alpha/data.txt **[/A5]**



**Q6**

```shell
cd /delta && cd alpha && /alpha/RUN.sh data.txt
```

**[A6]** /delta/alpha/data.txt **[/A6]**
