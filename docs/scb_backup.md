# Backup of the `CSB` storage

(the 2 first paragraphs below are taken for granted)

The main file server for `CSB` is `terra`. It holds 2 partitions of 190Tb 
called `apollo` and `artemis`, the brother and sister gods from ancient Greece. 

Both partitions are on RAID6 volumes with one spare disk, effectively 
using 15 out of 18 disks per partition. 
The `apollo` partition is backed up to a machine called `bkup`, 
located in C8:2 (small server room next to David’s office). 
The artemis partition is backed up to `odin`, the `beegfs` server. 
Backup is done using `rsync` every night. 
There is considerable room for improvement and making this more secure.

---------
##  `apollo`'s backup `bkup.icm.uu.se`

The `apollo` virtual disk on  `terra` is backed up by the `bkup` host, which is
 implemented as the RAID6 on the SuperMicro 
host with 36 disk slots with  AVAGO 3108 MegaRAID controller. The total 
capacity is about 260TB.

The `bkup`  RAID6 setup details are given in the  github
[gist.](https://gist.github.com/raalesir/56fa565472b0825f1a8595c78a45041a)

The backup is done with `rsync` using a bash script, located on the  `bkup` at
the `/root/backup.bkup`:
```bash
rsync -av  -e "ssh -c arcfour,aes128-ctr -o Compression=no"  terra.bkup:/homes/apollo  /homes/   --log-file=/var/log/backup/apollo.log
```

----
## `artemis`'s backup `odin`

There is a pretty large word-doc, which shoulb be reshaped... :/