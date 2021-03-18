# Q

Q is a set of Molecular Dynamics (MD) tools tailored to the following
specific kinds of free energy calculations:

- Free Energy Perturbation (FEP)
- Empirical Valence Bond (EVB)
- Linear Interaction Energies (LIE)

There exist several versions in circulation and we list here a few
which are available on CSB:

- 5.06 (version from circa 2007)
- 5.7 (descendant of 5.06; mostly Mauricio Esguerra's fixes)
- 5.10 (descendant of 5.06; mostly Kamerlin lab fixes; [Github](https://github.com/qusers/qsource))
- 6.0 (descendant of 5.10; major rehaul by Paul Bauer; GPLv2; [Github](https://github.com/qusers/Q6))
- 6.0.1_ME (descendant of 5.7; GPLv2; [Github](https://github.com/esguerra/q6))

To find the available modules simply run:

    ml spider Q


**Important!**  
Always run calculations in the scratch directory on the compute node.


## Example files

**q_csb.sh** (Slurm batch script)

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
