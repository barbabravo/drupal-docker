#!/bin/sh
echo 'Starting ...\n'

pwd=`pwd`

if [ ! -f "$pwd/drupal.tar.gz" ];then
	echo 'Downloading drupal first. Follow instructions: \n'
	echo '1. browse https://www.drupal.org/download-latest/tar.gz  to download  drupal-[version].tar.gz'
	echo '2. mv /pathto/drupal-[version].tar.gz $pwd/drupal.tar.gz '
	exit
fi

if [ ! -d "$pwd/app" ];then
	echo "Building...\n"
	tar -zxvf drupal.tar.gz
	mv drupal-* app
fi


if [ ! -f "$pwd/app/LICENSE.txt" ];then
	echo "Drupal file not exist, return\n"
	echo "Start failed.\n"
else
	sudo docker-compose up -d
	echo "Start successfully.\n"
	echo "Visit http://localhost:20080 to start your first drupal project\n"  
fi

