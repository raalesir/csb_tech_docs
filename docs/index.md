# Welcome to CSB!

You have reached the website of the **CSB** computational cluster at the **Institute of Cell and Molecular Biology, Uppsala University.**
Please check out the menu on the left for instructions on everything from establishing secure connections to installing and using scientific software on CSB.

# News

## September 2023

The `terra` is 80 percent full, making pretty big data reshaping and data storing 
habits change inevitable. More is coming soon.

## Sunday, 21 Mar 2021

- Apps were moved back to the network file system (/home/apps).
  This is required for smooth updates of the headnode in the future.
  If you use hardcoded paths to app binaries (not recommended), change
  from '/opt/homes/apps/apps/...' to '/home/apps/apps/...'.

- Applied important updates to headnode and compute nodes (required reboot).

## Thursday, 5 Mar 2021
If you see this message then the transition to the new CSB headnode went smoothly
and you didn't forget to install your SSH key. If you don't see this message,
please contact support.

Please check that all of your data is intact. 

##### What's new?
- Switched from ancient un-updatable Rocks 6.1 (kernel 2.6) to OpenHPC Leap 15.2.
- New module system (e.g. 'ml' shortcut, 'ml spider' searching).
- 2 AMD Epyc nodes with 128 threads. Use '-p CLUSTER-AMD' in sbatch script.
  (if running gromacs, make sure to load the _AMD module).
  
  
- **IMPORTANT**: Temporary scratch directory is no longer /scratch/partition1.
  Use the $TMPDIR variable in your sbatch scripts instead.
  
  
- **IMPORTANT**: When using MPI, use 'srun' instead of 'mpirun'.
  Example:  "srun -n 16 qdynp dyn.inp > dyn.out"
  
  
- **IMPORTANT**: Apps were reinstalled completely - use 'ml av' to see what
  is available. If you think an app is missing, please let us know. Old apps 
  were moved from /home/apps to /home/apps/OLD_CSB. They probably won't work
  as expected, so use at your own risk.

