#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y build-essential cmake libgmp3-dev gengetopt libpcap-dev
sudo apt-get install -y flex byacc libjson-c-dev pkg-config libunistring-dev
sudo apt install -y wget nginx

# Setup website
sudo mkdir /var/www/zmap
#echo "Zmap AWS Website" > /var/www/zmap/index.html
sudo cp index.html /var/www/zmap/index.html
sudo sh -c "sed -i 's/root \/var\/www\/html;/root \/var\/www\/zmap;/' /etc/nginx/sites-enabled/default"
sudo service nginx restart

# Make scan result directory
mkdir /home/ubuntu/scans
#chown ubuntu:ubuntu /home/ubuntu/scans

# Install zmap
wget https://github.com/zmap/zmap/archive/refs/tags/v3.0.0.tar.gz
tar -xf v3.0.0.tar.gz
cd zmap-3.0.0
cmake .
make -j4
sudo make install
