# ORCA

ORCA is an ab initio quantum chemistry program package that
contains modern electronic structure methods including density
functional theory, many-body perturbation, coupled cluster,
multireference methods, and semi-empirical quantum chemistry
methods. Its main field of application is larger molecules,
transition metal complexes, and their spectroscopic properties.
ORCA is developed in the research group of Frank Neese. [wiki]

- Website: [https://sites.google.com/site/orcainputlibrary/home](https://sites.google.com/site/orcainputlibrary/home)
- Tutorials: [https://www.orcasoftware.de/tutorials/index.html](https://www.orcasoftware.de/tutorials/index.html)
- Forum: [https://orcaforum.kofo.mpg.de/app.php/portal](https://orcaforum.kofo.mpg.de/app.php/portal)

To find the available modules simply run:

    ml spider orca


**Important!**  
Always run calculations in the scratch directory on the compute node.



## Example files

**water_sp.inp** (ORCA input file)
    
```
! B3LYP D3BJ def2-TZVP
! TightOpt

%pal
  nprocs 16
end

* xyz 0 1
O         -3.56626        1.77639        0.00000
H         -2.59626        1.77639        0.00000
H         -3.88959        1.36040       -0.81444
*
```



**orca_csb.sh** (Slurm batch script)

```bash
#!/bin/bash -l

#SBATCH -p CLUSTER
#SBATCH -n 16
#SBATCH -t 3-00:00:00

module purge
module load orca/4.2.1
orca_bin=$(which orca)   # needed for parallel

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
    $orca_bin $inp.inp > $inp.out
    rsync -ah $TMPDIR/ $jobdir/ --exclude="*tmp"
done

# copy back one last time
rsync -ah $TMPDIR/ $jobdir/ --exclude="*tmp"

# cleanup
rm -rf $TMPDIR
echo "Done"
```
