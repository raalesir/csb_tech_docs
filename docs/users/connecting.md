# Connecting to CSB

Simply type

    ssh YOUR_USERNAME@csb.bmc.uu.se

For a better user experience we suggest modifying the
**~/.ssh/config** file on your computer to include:

    Host csb
        User YOUR_USERNAME
        Hostname 130.238.41.206


Now type:

    ssh csb
