=========================================
= For users of the batch system on csb. =
=========================================

We use the SLURM queue manager, the same that is used on most SNIC
centres in Sweden. This would hopefully make that users are familiar
with it already. All users belong to a group (the same as your UNIX
group) and this association leads to certain access to the computer
resources. The queue system knows this already so you do not have to
specify this.

In your job file you basically need to specify the amount of cores you
want to use. Only parallellism within a node is allowed, so the
maximum number of cores is 16. Further you may specify a walltime in
order to get higher priority. The max walltime is 3 days for any
job, default is 15 minutes. Typical commands in your script might therefore be:

#SBATCH -N 1
#SBATCH -n 4
#SBATCH -t 8:00:00
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=END
#SBATCH --mail-user=john@doe.com

Important commands include sbatch, scancel, squeue, sshare. 
Use the UNIX man command to learn more about these commands.

