#ensure to do this from the root of the project folder, while the microservices are running
#!/bin/bash
docker exec -it wp-cli /usr/local/bin/wp db export --path=/var/www/html - > sql/dump.sql
docker cp wp-cli:/var/www/html/wp-content/. wp-content/
