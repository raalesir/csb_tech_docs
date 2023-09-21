## Log of Works

---

| **Date**: xx-yy-2023 | **Author**: A B |
----------------------|-----------------

<ins>Description</ins>: 

Add description



----

| **Date**: 21-09-2023 | **Author**: Alexey Siretskiy |
------|-----

<ins>Description</ins>: 

As agreed with David van der Spoel, some extremely large user home directories from `terra`
are being substituted by their `tar.gz` version.

<ins>Affected users:</ins>

- zahedeh
- lbortot
- hadi
- oliveira
- yildirim
- jinzhang 

<ins>Algorithm:</ins>

-  the archive for each user from above was created on `bkup` backup host. 
- the archive was unzipped on `bkup` to make sure it is not broken etc. 
- the `rsync` from `terra` to `bkup`been conducted to be extra sure that the unzipped home directory is ok. 
- the `tar.gz` been copyied from `bkup` to `terra`
- the sizes of two archived copies are compared: 
```bash
rw-r--r--.   1 root root    1510473728 Sep 19 09:49 zahedeh1.tar.gz
[admin@terra ~]$ ssh bkup ls -la /homes/apollo/temp/zahedeh.tar.gz
admin@bkup's password:
-rw-r--r-- 1 root root 9557612030916 Sep  3 14:29 /homes/apollo/temp/zahedeh.tar.gz
[admin@terra ~]$
```
- original home dir on `terra` is deleted:
```bash
[root@terra ~]# date
Thu Sep 21 08:37:36 CEST 2023
[root@terra ~]# rm -rf /homes/apollo/zahedeh/*
[root@terra ~]# date
Thu Sep 21 08:44:08 CEST 2023
[root@terra ~]#
```
- the archive is been placed to the home directory:
```bash 
[admin@terra ~]$ ls -lah /homes/apollo/zahedeh/zahedeh.tar.gz
-rw-r--r--. 1 root root 8.7T Sep 20 13:29 /homes/apollo/zahedeh/zahedeh.tar.gz
```

----------

