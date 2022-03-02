#!/bin/bash
sudo yum install wget unzip httpd -y
sudo systemctl start httpd -y
sudo systemctl enable httpd -y
wget https://www.tooplate.com/zip-templates/2117_infinite_loop.zip
unzip -o 2117_infinite_loop
cp -r 2117_infinite_loop/* /var/www/html/
sudo systemctl restart httpd