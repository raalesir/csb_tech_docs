# Submitting jobs

CSB uses the Slurm scheduling manager to allocate resources for jobs.
There are no particularly elaborate queueing rules, and for the most
part it is simply on a first come - first serve basis. 
Though there are several partitions available, most users
should only use CLUSTER (default) and CLUSTER-AMD.
Each user can run a maximum of 64 jobs at once, and is capped at 128
cores. Jobs spanning over several nodes are not allowed due to 
the performance penalty of the ethernet connection.

Quickstart guide: [https://slurm.schedmd.com/quickstart.html](https://slurm.schedmd.com/quickstart.html)

## Common Slurm commands

Information about Slurm nodes/partitions:
```bash
sinfo
```

Show the whole queue and my jobs only:
```bash
squeue
squeue -u USERNAME
```

Submit a calculation with a batch script (see example below):
```bash
sbatch q_csb.sh
```

Run an MPI program directly (no batch script) using 8 tasks (cores) and 1 hour wall time.
```bash
srun -n 8 -t 1:00:00 Qdyn5p qdyn.inp > qdyn.out
```

Cancel job with ID 1848
```bash
scancel 1848
```

Check out details on job 1848
```bash
scontrol show job 1848
```

## Common Slurm flags

- -n, --ntasks :  number of tasks per job
- -t, --time :  maximum running time
- -p, --partition : chosen partition, defaults to CLUSTER
- --exclusive : use all available cores on a node (NOTE: does not define the SLURM_NPROCS environment variable)


## Slurm environment variables

Slurm defines several useful variables which can be used during the execution of a job:

- $TMPDIR (scratch directory created by Slurm - /scratch/job_id)
- $SLURM_SUBMIT_DIR  (submission directory)
- $SLURM_NTASKS  (number of allocated tasks)
- $SLURM_NTASKS_PER_NODE (tasks per node, use with --exclusive)


## Example files

**q_csb.sh** (Slurm batch script for Q)

```bash
#!/bin/bash -l

#SBATCH -p CLUSTER
#SBATCH -n 16
#SBATCH -t 3-00:00:00

module purge
module load Q/6.0.1_ME
QDYNP=qdynp

echo "Host: $(hostname)"
echo "Tmpdir: $TMPDIR"
echo "Jobdir: $SLURM_SUBMIT_DIR"

# copy files to scratch dir
rsync -ah $SLURM_SUBMIT_DIR/ $TMPDIR/ --exclude="slurm*"
cd $TMPDIR

# run all inputs in alphanumerical order
inps=$(ls -1 *inp | sed 's/.inp//g')
for inp in ${inps[@]}
do
    srun -n $SLURM_NTASKS $QDYNP $inp.inp > $inp.out
    rsync -ah $TMPDIR/ $jobdir/ --exclude="*tmp"
done

# copy back one last time
rsync -ah $TMPDIR/ $jobdir/ --exclude="*tmp"

# cleanup
rm -rf $TMPDIR
echo "Done"
```
