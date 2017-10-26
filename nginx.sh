# disable SElinux
	# setenforce 0 
sed 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config 

# install nginx
yum install -y nginx  

# copy configuration files
cp -f "/vagrant/nginx.conf" /etc/nginx/
cp -f "/vagrant/upstream.conf" /etc/nginx/conf.d/

# set up permisions 
chown -R nginx: /etc/nginx
chmod -R 777 /etc/nginx/conf.d

# start nginx service
systemctl enable nginx.service
systemctl start nginx.service