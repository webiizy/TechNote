
#!/bin/bash
echo "install Nodejs 8x...................."
read -p "Do that? [y,n]" doit 
case $doit in
y|Y)

	echo "Let start to install nodejs 8x...."
	sudo apt-get update
	sudo apt-get install -y build-essential
	sudo apt remove -y libcurl4
	sudo apt install -y libcurl4 curl
	curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
	sudo apt-get install nodejs -y
	sudo apt-get install git -y
	sudo apt install net-tools -y
	sudo apt-get install -g nodemon
	node -v
	npm -v
	sudo npm i -g pm2
;;
esac

echo "install mongodb...................."
read -p "Do that? [y,n]" doit 
case $doit in
y|Y)

sudo apt install libcurl3
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod start
cat /var/log/mongodb/mongod.log
echo "install finished ...."
;;
n|N)
echo "bypass install mongodb ..."
;;
esac 
#sudo service mongod stop
#sudo apt-get purge mongodb-org*
#sudo rm -r /var/log/mongodb
#sudo rm -r /var/lib/mongodb

read -p "Do you want to install nignx ?[y,n]" doit
case $doit in 
y|Y)
sudo apt-get install nginx -y
;;
n|N)
echo "cancel to istall nginx"
esac

##################################
# INSTALL RABITMQ
#
###################################

read -p "Do you want to install RABITMQ ?[y,n]" doit
case $doit in 
y|Y)
	sudo apt-get install wget -y
	wget https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.7.7/rabbitmq-server_3.7.7-1_all.deb
	#wget https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.7.6/rabbitmq-server_3.7.6-1_all.deb
	#sudo dpkg -i esl-erlang_19.3.6-1~ubuntu~artful_amd64.deb
	sudo dpkg -i rabbitmq-server_3.7.6-1_all.deb
	sudo rabbitmq-server start
	echo "INSTALLING RABITMQ FINISHED---------------- "
	echo "INSTALLING WEBGUI-----------------"
	sudo rabbitmq-plugins enable rabbitmq_management
	sudo rabbitmqctl add_user admin admin
	sudo rabbitmqctl set_user_tags admin administrator
	sudo rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"
	echo "-------------------------------------------"
	echo "got link : http://localhost:15672"
	echo "-------------------------------------------"

;;
n|N)
echo "----#########_________##########"
esac