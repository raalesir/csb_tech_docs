# GROMACS

A free and open-source software suite for high-performance molecular dynamics and output analysis.

Some useful links:

- Website: [https://www.gromacs.org/](https://www.gromacs.org/)
- Tips on performance: [https://docs.bioexcel.eu/gromacs_bpg/en/master/cookbook/cookbook.html](https://docs.bioexcel.eu/gromacs_bpg/en/master/cookbook/cookbook.html)

To find the available modules simply run:

    ml spider GROMACS


**Important!**  
Always run calculations in the scratch directory on the compute node.


## Example files

Run script for the a job with 16 cores on one of the amd nodes: 

**run_gromacs.sh** (Slurm batch script)

```bash
#!/bin/bash -l

#SBATCH -p CLUSTER-AMD
#SBATCH -t 3-00:00:00
#SBATCH --ntasks=8
#SBATCH --cpus-per-task=2
#SBATCH --ntasks-per-socket=1

module purge
module load gromacs/2021_AMD

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

echo "Host: $(hostname)"
echo "Tmpdir: $TMPDIR"
echo "Jobdir: $SLURM_SUBMIT_DIR"

# copy files to scratch dir
rsync -ah $SLURM_SUBMIT_DIR/ $TMPDIR/ --exclude="slurm*"
cd $TMPDIR

# run gromacs sim(s)
gmx mdrun -ntomp 2 -ntmpi 8 -deffnm equil > equil.out
rsync -ah $TMPDIR/ $SLURM_SUBMIT_DIR/ --exclude="*tmp"

# cleanup
rm -rf $TMPDIR
echo "Done"
```


