# Complete automate installation of WP#
sudo yum update

sudo yum install -y vim wget zip unzip
echo "*****installation of packages done*****"

sudo yum install -y httpd
echo "*****installation of apache is done*****"

service httpd start
echo "*****Start the Apache service *****"

sudo yum install -y php php-mysql
echo "*****installation of PHP and PHP-MYSQL is Done*****"

service httpd restart
echo "*****Apache Service is Restarted*****"

sudo cd /var/www/html/
vim test.php #<?php  phpinfo() ?>

hostname #check wether the host is running or not#

sudo yum update
echo "*****Updating Complete yum repository*****"

wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
echo "*****Updating the MYSQL Repositories*****"
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
sudo yum update

sudo yum -y install mysql-server
echo "*****Installation of MYSQL Repositories*****"

service mysqld start
echo "*****Start the Mysql Service *****"

sudo mysqladmin -u root create arvisat
echo "*****Rename the Wordpress to Arvisat *****"

mysql_secure_installation # go with all Yes Options

wget http://wordpress.org/latest.tar.gz
echo "*****Wordpress is Downloaded*****"

tar -xzvf latest.tar.gz
echo "*****Untar of Wordpress is done"

sudo mv wordpress arvisat
echo "*****Renamed the Wordpress to Arvisat"

sudo cd /arvisat/


sudo mv wp-config-sample.php wp-config.php

sudo vim /etc/httpd/conf/httpd.conf # <directory> /var/www/html/ All Override None to replace with All#
========================================================================================================
#initiating ubuntu in virtual machine
vagrant init vagrant init ubuntu/xenial64
# Uncomment the ip address from the vagrantfile
config.vm.network "private_network", ip: "192.168.33.10"
#You are now ready to `vagrant up` your first virtual environment!
vagrant up
# NOw you can do vagrant ssh
vagrant ssh
# Updateing the ubuntu server
sudo apt update
# Setting up the localhost, by installing apache2.
apt-get install apache2
# ReStart the apache2 service
service apache2 restart
# TO know the Hostname ip address
hostname -I
wget hostname
# Browsing with the ip address or localhost that you can view the apache2 page
http://192.168.33.10/ - browse #if the page is not displayed. we have to copy the "index.html" to /var/www/html/

#Install Nginx Web Server
apt-get install nginx
#go to .html page for displaying Nginx
cd /var/www/html
ls #we can view "index.nginx-debian.html"
cp index.nginx-debian.html index.html #Copying the 'index.nginx-debian.html' to index.html
#You can browse http://192.168.33.10/ it and view the nginx server page.

#Searching about the php for installing
apt-cache search php

#INstalling php7.0-fpm
apt-get install php7.0-fpm

# Changing the permission for php
 vim /etc/nginx/sites-available/default

 # Add index.php to the list if you are using PHP
       index index.php index.html index.htm index.nginx-debian.html;


 Removing Comments(#)

 #location ~\.php4{
  #  include snippets/fastcgi-php.conf;
  #
  #  #with php7.0-cgi alnoe:
  #fastcgi_pass 127.0.0.1:9000;
  # #with php7.0-fpm:
  #    fastcgi_pass unix:/run/php/php7.0-fpm.sock;
  #}


  location ~\.php4{
    include snippets/fastcgi-php.conf;
   #
   #  #with php7.0-cgi alnoe:
   #fastcgi_pass 127.0.0.1:9000;
   # #with php7.0-fpm:
       fastcgi_pass unix:/run/php/php7.0-fpm.sock;
   }




 #restarting the services
 service nginx restart

 #Job for nginx.service failed because the control process exited with error code.See "systemctl status nginx.service" and "journalctl -xe" for details.
#give permission with
 sudo fuser -k 80/tcp
 sudo fuser -k 443/tcp

 #You can ReStart again
 sudo service nginx restart

#adding php info file in the /var/www/html
vim index.php #adding content <?php phpinfo(); ?>

#searching and installing the mysql
apt-cache search mysql
apt-get install mysql-server

#mysql monitoring or logining to mysql
 mysql -u root -p

 #Creating database
 mysql> create database arvisat;

 #Creating Username and Password
 mysql> CREATE USER 'arvisat'@'localhost'IDENTIFIED BY 'sathya';

#Grant All Peivileges
mysql> GRANT ALL PRIVILEGES ON arvisat.* TO 'arvisat'@'localhost';

FLUSH PRIVILEGES;
EXIT;

# Installing wordpress using latest version
wget https://wordpress.org/latest.tar.gz

#untar the wordpressfile
tar xvfz latest.tar.gz

# Renaming the wordpress as "Any-project name"
mv wordpress arvisat
chown www-data.www-data -R arvisat/
chown www-data.www-data -R arvisat/*


#installing php7.0-mysql
apt-get install php7.0-mysql

YOu can browse 192.168.33.10/arvisat/


HIstory
cd /opt
   2  ls
   3  ls -a
   4  hostname -I
   5  apt update
   6  apt-get install apache2
   7  ls
   8  service apache2 restart
   9  hostname -I
  10  wget localhost
  11  ls
  12  mv index.html /var/www/html/
  13  ls
  14  exit
  15  adduser sathyapriya
  16  sudo sathyapriya
  17  sudo su sathyapriya
  18  apt update
  19  passwd root
  20  su -
  21  exit
  22  sudo username
  23  apt install nginx
  24  cd /var/www/html
  25  ls
  26  cp index.nginx-debian.html index.html
  27  apt-cache search php
  28  apt-get install php7.0-fpm
  29  vim /etc/nginx/sites-available/default
  30  service nginx restart
  31  systemctl status nginx.service
  32  sudo systemctl start nginx.service
  33  sudo fuseer -k 80/tcp
  34  sudo fuser -k 80/tcp
  35  sudo fuser -k 443/tcp
  36  sudo service nginx restart
  37  ls
  38  vim index.php
  39  apt-cache search mysql
  40  apt-get install mysql-server
  41  mysql -u root -p
  42  wget https://wordpress.org/latest.tar.gz
  43  ls
  44  tar xf latest.tar.gz
  45  tar xvfz latest.tar.gz
  46  ls
  47  mv wordpress arvisat
  48  ls -ltr
  49  apt-cache search php-mysql
  50  apt-get install php7.0-mysql
  51  ls
  52  cd arvisat/
  53  ls
  54  cd ..
  55  mysql -u root -p
  56  chown www-data.www-data -R arvisat/
  57  chown www-data.www-data -R arvisat/*

