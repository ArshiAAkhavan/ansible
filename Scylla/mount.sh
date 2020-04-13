#https://blog.oshim.net/2011/10/how-to-move-var-folder-to-new-partition/


#How to move /var folder to a new partition in Linux

#make the new partition, & format with mkfs.ext3
mkfs.ext4 /dev/sdc  

#mount the new filesystem in /mnt
mkdir /mnt/newvar
mount /dev/sdc /mnt/newvar

#Go to single-user mode so that there is no rw activity on the directory during the process
#not recommended when using ssh!
init 1

#Backup data in var only (not the /var directory itself)
cd /var
cp -ax * /mnt/newvar

#Rename the /var directory (to make sure this has worked before deleting it!)
cd /
mv var var.old

#Make new var directory
mkdir /var

#Unmount the new partition
umount /dev/sdc

#Remount it as /var
mount /dev/sdc /var

#If everything goes fine then put an entry into /etc/fstab
cat /dev/sdc               /var          ext4    defaults        0 0 >> /etc/fstab
