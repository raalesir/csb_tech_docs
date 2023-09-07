# Adding user to `CBS` cluster

- `ssh` to `scb.icm.uu.se`, login as `root` or use `sudo`
- go to for instructions `/root/wd/README.users`
- after user `new_user` is created, one has to login as that user, like `su - new_user`, 
just `su new_user` will not work, one _must_ run the login shell. Message
```bash 
Configuring SSH for cluster access
```
should appear

- as the result in the `~/.ssh/authorized_keys`  `Warewulf Cluster key`
public key should appear
- add below the `new_user` public SSH-key