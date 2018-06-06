apt install firewalld
firewall-cmd --zone=public --add-port=8091/tcp --permanent
firewall-cmd --zone=public --add-port=8888/tcp --permanent
firewall-cmd --zone=public --add-port=9876/tcp --permanent
