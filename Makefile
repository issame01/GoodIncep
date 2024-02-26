all : 
	@docker-compose -f ./srcs/docker-compose.yml up -d
open :
	mkdir -p /goinfre/idryab/docker/.docker /goinfre/idryab/docker/com.docker.docker /goinfre/idryab/docker/com.docker.helper && open -g -a Docker
up : 
	@docker-compose -f ./srcs/docker-compose.yml up -d

down : 
	@docker-compose -f ./srcs/docker-compose.yml down

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start
prune :
	@docker system prune -af

status : 
	@docker ps