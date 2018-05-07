#!/bin/bash -x

apt-get -y update
apt-get install -y curl
apt-get install -y wget
apt-get install -y git
apt-get install -y less
apt-get install -y vim
apt-get install -y ntp

cd ~
curl -L https://www.opscode.com/chef/install.sh | bash
chmod u+x install.sh
./install.sh
wget https://packages.chef.io/files/stable/chefdk/2.4.17/ubuntu/16.04/chefdk_2.4.17-1_amd64.deb
dpkg -i chefdk_2.4.17-1_amd64.deb

wget http://github.com/opscode/chef-repo/tarball/master
tar -zxf master
mv chef-boneyard-chef-repo* chef-solo
rm master

chef-solo -v
cd chef-solo/
mkdir .chef
touch .chef/knife.rb
echo "cookbook_path [ '/home/ubuntu/chef-solo/cookbooks' ]" > .chef/knife.rb

git config --global user.email sloan949@gmail.com
git config --global user.name sloanm

cd /home/ubuntu/chef-solo/cookbooks
knife cookbook site download nginx
knife cookbook site download apt


tar xvf nginx-8.1.2.tar.gz
rm nginx-8.1.2.tar
tar xvf apt-7.0.0.tar.gz
rm apt-7.0.0.tar.gz

#chef generate cookbook nginx

cd  /root/chef-solo/cookbooks/nginx
cd ~/chef-solo

#chef-solo -c solo.rb -j web.json
