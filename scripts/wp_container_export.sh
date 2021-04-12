#ensure to do this from the root of the project folder, while the microservices are running
#!/bin/bash
ROOT_PW=$(grep DBRP .env | cut -d '=' -f2)

docker exec -it wp-db /usr/bin/mysqldump -u root -p"$ROOT_PW" wp | grep -v "Using a password" > sql/dump.sql
docker cp wp-cli:/var/www/html/wp-content/. wp-content/
