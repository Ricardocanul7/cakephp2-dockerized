COMPOSE=docker compose -f docker-compose.yml
EXEC_ROOT=${COMPOSE} exec php
USER_ID=1000
EXEC=${COMPOSE} exec -u ${USER_ID} php

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

docker-project-init: ## Initialize project
	# cp .env.example	.env
	${COMPOSE} up -d --build
	${EXEC} cp app/Config/database.php.default app/Config/database.php
	@echo "app/Config/database.php created, don't forget to change values with the credentials for the docker db service located in .env file"
	${EXEC} cp app/Config/email.php.default app/Config/email.php
	@echo "app/Config/email.php created, don't forget to change the file with your custom configuration"
	${EXEC} composer install
	make fix-tmp-folder-permissions

docker-restart:	## Restart and rebuild containers (useful when changing PHP versions)
	${COMPOSE} down
	${COMPOSE} up -d --build
	${EXEC} composer install

docker-start:	## Start the project without re-building containers
	${COMPOSE} up -d

docker-stop:	## Stop containers
	${COMPOSE} down

docker-destroy:	## Stop containers and reset database
	${COMPOSE} down -v

bash:	## Log into php container
	${EXEC} bash

fix-tmp-folder-permissions:
	${EXEC_ROOT} chmod 777 -R app/tmp/