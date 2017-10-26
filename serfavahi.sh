# install repo
yum install -y epel-release 

# if you want to install latest nginx release just uncomment code near
	# cp ~/deploy/repo/nginx.repo /etc/yum.repos.d/

# install packages 
yum install -y wget unzip nss-mdns


# install and run avahi 
yum install -y avahi avahi-tools
systemctl enable avahi-daemon
systemctl start avahi-daemon


# install serf
# useradd -u 550 serf
wget https://releases.hashicorp.com/serf/0.8.1/serf_0.8.1_linux_amd64.zip
cd /usr/local/bin
tar -xvf
chmod 755 serf 
cp "/vagrant/serf.service" /etc/systemd/system/serf.service