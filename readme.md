1. Create a new project

To start drupal project, just run like this (docker && docker-compose should be installed first)

$ chmod +x run.sh

$ ./run.sh

When init the drupal configuration, use

```
Database: drupal
username: drupal
password: drupal

host: database
port: 3306
```

2. If you already have an project.

First copy the project files into web folder.

$ sh run.sh 

Then open the docker-compose.yml, modify following parameter,

    MYSQL_DATABASE: [your project database] 
    MYSQL_USER: [your database user]
    MYSQL_PASSWORD: [your database password]

Make a directory named bridgedir, copy your existing database sql into bridgedir. You can see the folder in database image with the path '/bridgedir'.

Start the docker, then use 
$ docker exec -it [database image] bash 
import sql data into the database
