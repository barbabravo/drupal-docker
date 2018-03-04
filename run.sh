#!/bin/sh
echo 'Starting ...\n'
version='8.4.2'

pwd=`pwd`

if [ ! -f "$pwd/drupal-$version.tar.gz" ];then
	echo 'Downloading drupal ...\n'
	wget https://ftp.drupal.org/files/projects/drupal-$version.tar.gz 
	echo 'Downloading drupal successfully\n'
fi

if [ ! -d "$pwd/web" ];then
	echo "Building your first drupal project...\n"
	if [ ! -f "$pwd/drupal-$version.tar.gz" ];then
		echo 'Downloading drupal ...\n'
		wget https://ftp.drupal.org/files/projects/drupal-$version.tar.gz
		echo 'Downloading drupal successfully\n'
	fi
	tar -zxvf drupal-$version.tar.gz
	mv drupal-$version/ web 
fi
if [ ! -d "$pwd/bridgedir" ];then
        echo 'Building bridge directory ...\n'
        mkdir bridgedir
fi
if [ ! -d "$pwd/datadir" ];then
	echo 'Building database directory ...\n'
	mkdir datadir
fi

if [ ! -f "$pwd/web/LICENSE.txt" ];then
	echo "Drupal file not exist, return\n"
	echo "Start failed.\n"
else
	sudo docker-compose up -d
	echo "Start successfully.\n"
	echo "Visit http://localhost:8000 to start your first drupal project\n"  
fi

