# Lightning Talk

```
This is the same as the master branch but has support for Arch Linux. The only
difference is the shellcode contains the environment "HOME=/home/jc"
```

## Steps to execute

### Linux

1. Use the command below to disable
[aslr](https://en.wikipedia.org/wiki/Address_space_layout_randomization)
for an instance of `bash`. Every child process will have aslr disabled.

```
setarch `uname -m` -R /bin/bash
```

2. Construct the binairies, `vuln` and `hak`, with `make`.

3. `./hak | ./vuln` to send the payload.

NOTE: If there is a segmentation fault (highly likely), that is most likely
from an invalid return address. Update `goal` in hak.c to the address given
by vuln, and continue from step 2.

### MacOS

Try the Linux instructions. I'm not sure if all the tools can be found on
a Mac.

### Windows

Follow the instructions
[here.](https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop)
