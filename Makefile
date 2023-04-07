all:
	docker compose -f ./srcs/docker-compose.yml up --build &

down:
	docker compose -f ./srcs/docker-compose.yml down

re: down all

stop_containers:
	docker stop $$(docker ps -qa) 2> /dev/null || true
	docker rm $$(docker ps -qa) 2> /dev/null || true

reset_volumes: down
	docker volume rm $$(docker volume ls -q) 2> /dev/null || true
	rm -rf /home/aben-ham/data/db/*
	rm -rf /home/aben-ham/data/wordpress/*

reset_networks: down
	docker network rm $$(docker network ls -q) 2> /dev/null || true

reset_images: down
	docker image rm $$(docker image ls -q)

all_hard: down
	docker network rm $$(docker network ls -q) 2> /dev/null || true
	docker volume rm $$(docker volume ls -q) 2> /dev/null || true
	rm -rf /home/aben-ham/data/db/*
	rm -rf /home/aben-ham/data/wordpress/*
	docker compose -f ./srcs/docker-compose.yml up --build &
