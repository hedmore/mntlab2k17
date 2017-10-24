# base node.vm.box = 'centos-7.4-x86_64-minimal'

# number of nodes
nCounter = 2

# nginx
Vagrant.configure("2") do |config|
  config.vm.define "node-nginx" do |node|
    node.vm.box = 'centos/7'
    node.vm.hostname = "node-nginx"
    node.vm.network 'private_network', ip: "192.168.10.10"
    node.ssh.insert_key = false
    node.vm.provider 'virtualbox' do |v|
      v.name = "node-nginx"
      v.memory = 1024
      v.cpus = 1
    end

    # set up serf & avahi
    node.vm.provision 'shell', path: "./sh/serfavahi.sh" 

    # configure serf
    node.vm.provision 'shell', inline: <<-EOF
          systemctl 
        EOF

    # set up nginx web server
    node.vm.provision "shell", path: "./sh/nginx.sh"
     
    # configure nginx web server
        node.vm.provision 'shell', inline: <<-EOF
          systemctl nginx.service 
        EOF

  end
  
  # tomcat
  (1..nCounter).each do |i|
    config.vm.define "node-tomcat#{i}" do |node|
        node.vm.box = 'centos/7'
        node.vm.hostname = "node-tomcat#{i}"
        node.vm.network 'private_network', ip: "192.168.10.#{i + 10}"
        node.ssh.insert_key = false
        node.vm.provider 'virtualbox' do |v|
          v.name = "node-tomcat#{i}"
          v.memory = 2048
          v.cpus = 1
        end

        # set up set up serf & avahi
        node.vm.provision 'shell', path: "./sh/serfavahi.sh"
         
        configure serf
        node.vm.provision 'shell', inline: <<-EOF
        systemctl 
        EOF

        # set up tomcat app server
        node.vm.provision "shell", path: "./sh/tomcat.sh"

        configure tomcat app server
        node.vm.provision 'shell', inline: <<-EOF
        sh /usr/local/tomcat/apache-tomcat-9.0.1/bin/startup.sh 
        EOF
    end

  end

end
