# WordPress implementation using wp-cli and Docker

Provides a basic scaffolding for auto-download and build stages with wp-content and sql dump included in the sub-folders

### folders
* ./scripts - Scripts for export and startup for use either inside or outside the containers
* ./sql - A dump file of a completed wp-installation and configuration
* ./wp-content - A fully populated folder with modules, themes and file uploads

### Required files
* docker-compse.yml - Creates database, phpmyadmin & wp-cli containers
* .env - Required to set initial credentials for database and admin users

### Installation
```
cp env_example .env
docker-compose up
```

### Access
http://localhost:8080 - WordPress instance executing with inbuilt PHP webserver
http://localhsot:9999 - PHPMyAdmin interface to manually inspect Database

### Modification
edit ./scripts/wp_container_start.sh to add extra wp-cli features, such as the downloading and enabling of modules and themes.  

### export 
```
./scripts/wp_container_export.sh 
```
Exports both database and wp-content files out of their respective RUNNING containers, to be pushed up to a private repository as backup.

[![Try in PWD](https://raw.githubusercontent.com/play-with-docker/stacks/master/assets/images/button.png)](https://labs.play-with-docker.com/?stack=https://raw.githubusercontent.com/jptafe/wp-cli-docker/main/docker-compose.yml)
