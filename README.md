# Lightning Talk

## Steps to execute

1. `setarch ``uname -m`` -R ``which bash``` to disable aslr for `bash`.
    Every child process will aslr disabled.

2. Construct the binairies, `vuln` and `hak`, with `make`.

3. `./hak | ./vuln` to send the payload.

NOTE: If there is a segmentation fault, that is most likely from an invalid
return address. Update `goal` in hak.c to the address given by vuln.
