# Labs 02 Quiz

## Filename wildcards

Get contents of all files in subdirectory `login` that
start with a decimal digit, ends with `z.txt` and the middle letter is
any letter from your GitLab login (in lowercase).

For example, if your login is `johndoe`, you should paste contents from files
`0jz.txt`, `1ez.txt` but not from `ajz.txt` or `2wz.txt` or
`0jx.txt`.


**Q1** Paste the contents of the files here (10 points).

**[A1]** lotygjklotygjklotygjklotygjklotygjklotygjk **[/A1]**


**Q2** Insert here the wildcard pattern that you have used (10 points).

**[A2]** [0-9][zavidnyi]z.txt **[/A2]**


## Reading files

Learn about `/proc/uptime` and about the `cut` command.
Then use this knowledge to create a command that prints number
of seconds your machine is running.

**Q3** Paste here the command (not its output!) (25 points).

**[A3]** cut -d " " -f 1 /proc/uptime **[/A3]**


## Reading manuals

**Q4** Explain in *your own words* what the `-i` switch of `wget`
does (15 points).


**[A4]** tells wget from which file (input file) it can read URLs of the download files. **[/A4]**


## `/proc/partitions`

**Q5** Explain what is stored in the third column of this file (10 points).

**[A5]** data on disks actually occupy 'blocks' of memory, not just bytes. The third column actully tells us how mnay block on the specific disk are occupied **[/A5]**


**Q6** How would you convert the last column (`name`) to a filename representing
the partition (10 points)?

**[A6]** no need to convert, the 'name' in the last column is the same as the 'filename' contained in the /dev **[/A6]**



## Other bits

**Q7** What version of `ls` do you have (10 points)?

Paste here the first line of the full version info only.

**[A7]** ls (GNU coreutils) 8.28 **[/A7]**


**Q8** Clean-up the following path so that it does not contain
any reference to the current or parent directory (10 points).

```
/home/../usr/./share/./man/../../lib/../../etc/ssh/.././os-release
```

**[A8]** /etc/os-release **[/A8]**
