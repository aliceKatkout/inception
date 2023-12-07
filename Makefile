#Colors:
GREEN		=	\e[92;5;118m
YELLOW		=	\e[93;5;226m
GRAY		=	\e[33;2;37
RESET		=	\e[0m

all:
	@printf "$(GREEN) - Launching docker-compose...\n$(RESET)"
	mkdir -p /home/avedrenn/data/mariadb
	mkdir -p /home/avedrenn/data/wordpress

	
	sudo docker compose -f ./srcs/docker-compose.yml build

	sudo docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

start:
	sudo docker compose -f ./srcs/docker-compose.yml start

stop:
	@printf "$(YELLOW) - stop dockers\n$(RESET)"
	@sudo docker stop $$(docker ps -qa)

fclean: stop
	@printf "$(YELLOW) - rm directories\n$(RESET)"
	sudo rm -rf /home/avedrenn/data/mariadb/*
	sudo rm -rf /home/avedrenn/data/wordpress/*
	@printf "$(YELLOW) - rm docker\n$(RESET)"
	@sudo docker rm $$(docker ps -qa)
	@printf "$(YELLOW) - rm images\n$(RESET)"
	@sudo docker rmi -f $$(docker images -qa)
	@printf "$(YELLOW) - rm volumes\n$(RESET)"
	@sudo docker volume rm $$(docker volume ls -q)
	@printf "$(YELLOW) - rm network\n$(RESET)"
	@sudo docker network rm inception


re: fclean all

.PHONY: all logs stop fclean