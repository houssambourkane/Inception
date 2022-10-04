DOCKER_COMMAND = docker-compose -f /home/hbourkan/inception/srcs/docker-compose.yml
RMV = rm -rf
CLONE_WEBSITE = /bin/sh -c 'if [ ! -d /home/hbourkan/data/html/hbourkan.42.fr ]; then git clone https://github.com/houssambourkane/my_portfolio.git /home/hbourkan/data/html/hbourkan.42.fr/; fi'


all:
	${CLONE_WEBSITE} && \
	${DOCKER_COMMAND} up --build

detach:
	${CLONE_WEBSITE} && \
	${DOCKER_COMMAD} -d up --build

clean:
	rm -f /home/hbourkan/data/html/wp-config.php && \
	${DOCKER_COMMAND} down

fclean: clean
	${RMV} /home/hbourkan/data/html/*
	${RMV} /home/hbourkan/data/mariadb/*

re: clean all

reload_website:
	${RMV} /home/hbourkan/data/html/hbourkan.42.fr && \
	${CLONE_WEBSITE}
