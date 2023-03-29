#!/bin/bash



#FTP_USR=aben-ham.42.fr
#FTP_PWD=123456

# Add the FTP_USER, change his password and declare him as the owner of wordpress folder and all subfolders
mkdir -p /var/run/vsftpd/empty
chmod -w /var/run/vsftpd/empty
mkdir -p /home/$FTP_USR


useradd $FTP_USR
echo "$FTP_USR:$FTP_PWD" | /usr/sbin/chpasswd &> /dev/null
chown -R $FTP_USR:$FTP_USR /var/www/$FTP_USR/html

echo $FTP_USR > /etc/vsftpd.userlist

echo "FTP started"
/usr/sbin/vsftpd /etc/vsftpd.conf
