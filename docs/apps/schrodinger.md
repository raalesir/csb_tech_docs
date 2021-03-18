# Schrodinger suite

The Schrodinger license server on CSB contains valid tokens for most
Schrodinger suite tools including Glide, Jaguar, Qsite, etc. It's
running on **csb.bmc.uu.se:27008** but it is accessible only from 
inside the CSB internal network. See below for instructions
on how to use it.

## Maestro (CSB installation + X11 forwarding)


It is possible to run Maestro directly on the head node through
XForwarding, however, it can be painfully slow and needlessly
uses up precious bandwidth.

    ssh -X USER@csb.bmc.uu.se
    ml load schrodinger/2020-3
    maestro

When submitting jobs, make sure to select the CSB2 queue.


## Maestro (local installation + SSH tunelling)

For security purposes, the firewall prevents accessing the license
server at csb.bmc.uu.se directly. To use it remotely, we must
trick Maestro into thinking that your computer is csb.bmc.uu.se
and use SSH port forwarding to make a tunnel to the ports on the
actual server.

So, if you are running Maestro in your laptop/desktop you will need
to modify your **/etc/hosts** file and add the following line at the
end:

    127.0.0.1        csb.bmc.uu.se

NOTE: This will effectively break any custom configuration that relies
on **csb.bmc.uu.se** resolving to its actual address (.ssh/config,
aliases, etc.). Make sure to change any such settings to point to
the IP address **130.238.41.206** instead.

You can test the DNS name to IP address mapping by using:

    ping -c1 csb.bmc.uu.se

Now you have to open a tunnel in order to reach the ports in which
the license server is running. You do this with:

    ssh -N -L 53000:csb.bmc.uu.se:53000 -L 27008:csb.bmc.uu.se:27008 YOUR_USERNAME@130.238.41.206

Don't forget to end the connection when you no longer need it (CTRL-C).

Once you have installed schrodinger20XX-X in your desktop make sure
to remove old licenses. On MacOS they will be in
**/Library/Application Support/Schrodinger**.
On Linux they can be found in **/opt/schrodinger20XX-X/licenses**.
It's also recommended to remove old configurations present in the
**.schrodinger** folder in your local home folder.

To install the new license on MacOS run the **Configuration**
(in /Applications/SchrodingerSuites20XX-X/). On Linux, run the
following commands:

    export SCHRODINGER=/opt/schrodinger20XX-X/
    $SCHRODINGER/utilities/configure

Select "I can identify my license server", type in **csb.bmc.uu.se** for the hostname and **27008** for the port.

If you need to send jobs to the queue you will need to modify your
local **schrodinger.hosts** file at **/opt/schrodinger/suites20XX-X/**.

Add the following to the end of your local schrodinger.hosts file:


    Name: CSB2
    Host: csb.bmc.uu.se
    schrodinger: /opt/homes/apps/apps/schrodinger2020-3
    processors: 128
    tmpdir: /scratch
    Queue: SLURM2.1
    Qargs: --partition=CLUSTER --ntasks=%NPROC%
    env: SCHRODINGER_TMPDIR=/scratch
    env: SCHRODINGER_MPIRUN_OPTIONS=-x TMPDIR
    env: LD_PRELOAD=""
    env: ENV=""
    env: BASH_ENV=""

and select the **CSB2** queue in Maestro when submitting the
calculations. **NOTE** that for threaded or MPI calculations (e.g.
**Jaguar**) the maximum number of CPUs you can select is **32**,
since we don't support multi-node calculations.
Higher number of CPUs can be selected for calculations which are
distributed into many independent subjobs, such as docking with
**Glide**.


## Jaguar

You can run Jaguar from Maestro by selecting the CSB2 queue and max of 32 cores, or you can submit the calculations on the command line on CSB:

    module load schrodinger/2020-3
    jaguar run MYJAGINPUT.in -jobname MYJOBNAME -HOST CSB2 -PARALLEL 32



