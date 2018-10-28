#!/bin/sh
echo 'Starting ...\n'

pwd=`pwd`

if [ ! -f "$pwd/drupal.tar.gz" ];then
	echo 'Downloading drupal ...\n'
	curl -L https://www.drupal.org/download-latest/tar.gz  > drupal.tar.gz
	echo 'Downloading drupal successfully\n'
fi

if [ ! -d "$pwd/app" ];then
	echo "Building your first drupal project...\n"
	if [ ! -f "$pwd/drupal.tar.gz" ];then
		echo 'Downloading drupal ...\n'
		curl -L https://www.drupal.org/download-latest/tar.gz  > drupal.tar.gz
		echo 'Downloading drupal successfully\n'
	fi
	tar -zxvf drupal.tar.gz
	mv drupal-* app
fi


if [ ! -f "$pwd/app/LICENSE.txt" ];then
	echo "Drupal file not exist, return\n"
	echo "Start failed.\n"
else
	sudo docker-compose up -d
	echo "Start successfully.\n"
	echo "Visit http://localhost:8000 to start your first drupal project\n"  
fi

