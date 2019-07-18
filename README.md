# Lightning Talk

## Steps to execute

### Linux

1. Use the command below to disable aslr of an instance of `bash.
    Every child process will have aslr disabled.

```
setarch `uname -m` -R /bin/bash
```

2. Construct the binairies, `vuln` and `hak`, with `make`.

3. `./hak | ./vuln` to send the payload.

NOTE: If there is a segmentation fault (highly likely), that is most likely
from an invalid return address. Update `goal` in hak.c to the address given
by vuln, and recompile with `make`.

### MacOS

Try the Linux instructions. I'm not sure if all the tools can be found on
a Mac.

### Windows

Follow the instructions
[here.](https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop)
