# Gaussian

In your script (csh only) add the following line:
  
For Gaussian03:
```
source /home/apps/apps/g03/g03.csh
```

For Gaussian09:
```
source /home/apps/apps/g09/g09.csh
```

You can use a max of 4 cores (if a machine is available) using
the shared memory facility of Gaussian. Linda support is not available.
Use `%nprocshared=4` in your .com file.

Make sure that the memory you specify in your Gaussian job is no more
than 75% of what you specify in the job file.

## Example files

**hf-1-opt.com**
```
%mem=1504MB
%nprocshared=4
# MP2/cc-pVDZ Opt=VeryTight Density maxdisk=10GB
 
HF-Dimer
 
0 1  
        9                0.037355    1.430650    0.000000
        1                0.152278    0.512817    0.000000
```

**g09_csb.sh**
```csh
#!/bin/csh

#SBATCH -n 1
#SBATCH -c 4
#SBATCH -t 8:00:00

source /home/apps/g09/g09.csh

setenv job hf-1-opt
setenv GAUSS_SCRDIR $TMPDIR

echo "Running on " `hostname`
grep MemTotal /proc/meminfo
grep SwapFree /proc/meminfo

# The following section updates the memory requirements in the
# Gaussian .com file
setenv MEM    `grep MemTotal /proc/meminfo | awk '{printf("%d\n",0.75*$2/1024)}'`
setenv JOBCOM "${job}.com"
setenv TMPCOM "$GAUSS_SCRDIR/koko.com"
echo "%mem=${MEM}MB" > $TMPCOM
grep -iv '%mem' $JOBCOM >> $TMPCOM
mv $TMPCOM $JOBCOM

g09 $JOBCOM

rm -rf $GAUSS_SCRDIR
```

