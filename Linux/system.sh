#!/bin/bash


#Make backup directories 
if [ ! -d backups] ;then
 sudo mkdir backups && sudo mkdir backups/{freemem,diskuse,openlist,freedisk}
fi

#output results 
free -h > backups/freemem/free_mem.txt
df -h > backups/diskuse/disk_usage.txt
lsof > backups/openlist/open_list.txt
df -k > backups/freedisk/free_disk.txt
