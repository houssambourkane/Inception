# Inception
This project aims to set up a webserver on which a wordpress website will be served, with the connection to the Mariadb database made via wordpress.

### Main tools used for this project :
- Docker and docker-compose
- NGINX (Web server)
- Wordpress
- Mariadb (SQL database)
- Redis (For caching)
- FTP server
- Adminer (For a mysql database UI)
- Jenkins (for a CI/CD pipeline)

Each of these tools will run on a docker container and will be interconnected via the docker network.

> ### Guide for the directories tree<br>
> Makefile: this file is the one we're gonna run to spin up all the containers. It uses the docker-compose command to launch all the required containers (in order)<br>
srcs<br>
|___.env: contains the environment variables file that will be available certain containers.<br>
|___docker-compose.yml: it contains the configuration of every docker container that we will be launching, we specify the path that docker-compose will follow to build the image of the container, and then run an instance of it using docker-compose up<br>
|___requirements<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|___nginx<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|___wordpress<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|___mariadb<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|___bonus<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|___redis<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|___ftp<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|___adminer<br>
        
 *Each of the requirements have it's own Dockerfile and configuration (Jenkins will be the only service that pull the image from dockerhub) *
