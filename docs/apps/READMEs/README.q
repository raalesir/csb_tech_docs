=========================================
=       For users of Q at csb.          =
=========================================

In your script (bash only) add the following line:

For Q 5.06:
export qdir=/home/apps/q-5.06

And then use the qdir environment variable to call the Q programs,
for example:

    $qdir/qprep < prepfile.inp > prepfile.log
    $qdir/qdyn eq1.inp > eq1.log

You can use a max of 8 cores (if a machine is available) using the parallel
version of qdyn, that is, the "qdynp" executable.

OpenMPI support is available, but be conscious of the limited resources and
do not hog all nodes.

Include the following line in your script to load openMPI:

module load openmpi-x86_64

And use the "qdynp" executable to run your MD runs.

NOTE:
Don't forget to use the "mpirun -np numberofcores" command to call
"qdynp" using openmpi.

Check /home/apps/examples/q-5.06 for working input.

