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
        
 *Each of the requirements have it's own Dockerfile and configuration (Jenkins will be the only service that pull the image from dockerhub)*


To use this project, please use the following steps

Change the variables WEBSITE_NAME and WEBSITE_REPO to use your own website, the WEBSITE_REPO has to reside in a code hosting platform that supports git such as https://github.com/

### Install docker on your local machine, follow this guide https://docs.docker.com/engine/install/

### Install git on your local machine, it will depend on the OS running inside it, for example debian OS has the package manager Apt, to install git in Debian we use
```
sudo apt-get update && apt-get install git -y
```
### Clone the repository on your local machine
```
git clone https://github.com/houssambourkane/Inception && cd Inception
```

### Run the following command to start the system
```
make all
```
### In order to run it on a detach mode use
```
make detach
```
### To clean the resources use
```
make docker_purge
```
