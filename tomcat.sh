# install java
wget wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/jdk-8u152-linux-x64.rpm"
yum localinstall -y jdk-8u152-linux-x64.rpm

# install tomcat
mkdir -p /usr/local/tomcat/
cd /usr/local/tomcat/
wget http://ftp.byfly.by/pub/apache.org/tomcat/tomcat-9/v9.0.1/bin/apache-tomcat-9.0.1.zip
unzip apache-tomcat-9.0.1.zip 
chmod 755 /usr/local/tomcat/apache-tomcat-9.0.1
chmod +x /usr/local/tomcat/apache-tomcat-9.0.1/bin/*.sh

# copy configuration files
cp -f "./deploy/xml/tomcat-users.xml" /usr/local/tomcat/apache-tomcat-9.0.1/conf/

# clearing operation
rm apache-tomcat-9.0.1.zip 