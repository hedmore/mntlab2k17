# disable SElinux
setenforce 0 

# install nginx
yum install -y nginx  

# copy configuration files
cp -f "/conf/nginx.conf" /etc/nginx/
cp -f "/conf/upstream.conf" /etc/nginx/conf.d/

# set up permisions 
chown -R nginx: /etc/nginx
chmod -R 777 /etc/nginx/conf.d

# start nginx service
systemctl enable nginx.service
systemctl start nginx.service