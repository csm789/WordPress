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
