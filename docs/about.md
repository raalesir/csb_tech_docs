# About

A happy little cluster looking for fresh nodes.

## Hardware

The cluster is bummed to be CPU-only, but takes great pride in its microarchitecture diversity. A total of 28 compute nodes span microarchitectures from Intel Sandybridge, Ivy Bridge, Haswell to AMD Epyc. The head node is a new Dell R640 which handles all the job scheduling, compute node provisioning, and monitoring of the nodes and network. The files in your home directory are stored on a beefy 384 TB fileserver and are backed up daily.

**Nodelist**

 Node            |  Cores/Threads |   CPU model        |  RAM (GB)
:---------------:|:--------------:|:------------------:|:---------:
 compute-0-0     |   16           |   Xeon E5-2660     |    128
 compute-0-1     |   16           |   Xeon E5-2660     |    128
 compute-0-2     |   16           |   Xeon E5-2660     |    128
 compute-0-3     |   16           |   Xeon E5-2660     |    128
 compute-0-4     |   16           |   Xeon E5-2660     |    128
 compute-0-5     |   16           |   Xeon E5-2660     |    128
 compute-0-6     |   16           |   Xeon E5-2660     |    128
 compute-0-7     |   16           |   Xeon E5-2660     |    128
 compute-0-8     |   32 (HT)      |   Xeon E5-2630-v3  |    64
 compute-0-9     |   32 (HT)      |   Xeon E5-2630-v3  |    64
 compute-0-10    |   32 (HT)      |   Xeon E5-2630-v3  |    64
 compute-0-11    |   32 (HT)      |   Xeon E5-2630-v3  |    64
 compute-0-12    |   32 (HT)      |   Xeon E5-2630-v3  |    64
 compute-0-13    |   32 (HT)      |   Xeon E5-2630-v3  |    64
 compute-0-14    |   32 (HT)      |   Xeon E5-2620-v4  |    128
 compute-0-15    |   32 (HT)      |   Xeon E5-2620-v4  |    128
 compute-0-16    |   32 (HT)      |   Xeon E5-2620-v4  |    128
 compute-0-17    |   32 (HT)      |   Xeon E5-2620-v4  |    128
 compute-0-18    |   32 (HT)      |   Xeon E5-2620-v4  |    128
 compute-0-19    |   32 (HT)      |   Xeon E5-2620-v4  |    128
 compute-0-20    |   32 (HT)      |   Xeon E5-2620-v4  |    128
 compute-0-21    |   32 (HT)      |   Xeon E5-2620-v4  |    128
 compute-0-22    |   32 (HT)      |   Xeon E5-2620-v4  |    128
 compute-0-23    |   32 (HT)      |   Xeon E5-2620-v4  |    128
 compute-0-24    |   32 (HT)      |   Xeon E5-2620-v4  |    128
 compute-0-25    |   32 (HT)      |   Xeon E5-2620-v4  |    128
 compute-0-26    |   128 (HT)     |   Epyc 7452        |    257
 compute-0-27    |   128 (HT)     |   Epyc 7452        |    257

[]()



## Software

CSB is designed around the **OpenHPC v2.1** software stack with the base distribution of **OpenSUSE Leap15.2**. We are using **Slurm** for managing resources and **Warewulf** for provisioning compute nodes in a stateless mode. Many scientific software packages are preinstalled in a modular fashion using the well known **Lmod** environment module system.

