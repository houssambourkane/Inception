DOCKER_COMMAND = sudo docker compose -f ./srcs/docker-compose.yml
WEBSITE_NAME = hbourkan.42.fr
WEBSITE_REPO = https://github.com/houssambourkane/my_portfolio.git
RMV = sudo rm -rf
CLONE_WEBSITE = sudo /bin/sh -c 'if [ ! -d ~/data/html/${WEBSITE_NAME} ]; then git clone ${WEBSITE_REPO} ~/data/html/${WEBSITE_NAME}/; fi'
ALL_CONTAINERS = `docker ps -qa`
ALL_VOLUMES = `docker volume ls -q`
ADD_HOST = sudo /bin/sh -c 'if grep "${WEBSITE_NAME}" /etc/hosts ; then echo "DNS mapping already exists on hosts"; else sudo echo "127.0.0.1       ${WEBSITE_NAME}" >> /etc/hosts ;fi'


# Color
BLACK = \e[30m
RED = \e[31;52m
RED_BOLD = \e[1;31m
GREEN = \e[32m
GREEN_BOLD = \e[1;32m
YELLOW = \e[33m
YELLOW_UNDERLINE = \e[4;33m
BLUE = \e[34m
BLUE_BOLD = \e[1;34m
MAGENTI = \e[35m
MAGENTI_BOLD = \e[1;35m
CYAN = \e[36m
WHITE = \e[37m
RESET= \e[0m

all: setup
	${CLONE_WEBSITE} && \
	${DOCKER_COMMAND} up --build
	@printf "✅ $(GREEN_BOLD) System Set up successfully$(RESET)\n"

detach: setup
	${CLONE_WEBSITE} && \
	${DOCKER_COMMAD} -d up --build
	@printf "✅ $(GREEN_BOLD) System Set up successfully$(RESET)\n"

setup:
	@printf "$(CYAN)Setting up the system...$(RESET)\n"
	@mkdir -p ~/data/html/
	@mkdir -p ~/data/mariadb/
	${ADD_HOST}

clean:
	@ ${RMV} ~/data/html/wp-config.php && \
	${DOCKER_COMMAND} down

docker_purge:
	sudo docker stop ${ALL_CONTAINERS} ; \
	sudo docker rm -f ${ALL_CONTAINERS}  ; \
	sudo docker volume rm ${ALL_VOLUMES} ; \
	sudo echo "Y" | docker system prune ; \
	${RMV} ~/data
	@printf "🗑 $(RED_BOLD) Purged all data$(RESET)\n"

fclean: clean
	${RMV} ~/data/html/*
	${RMV} ~/data/mariadb/*

re: clean all

reload_website:
	${RMV} ~/data/html/hbourkan.42.fr && \
	${CLONE_WEBSITE}
	@printf "✅ $(GREEN_BOLD) System reloaded successfully$(RESET)\n"
