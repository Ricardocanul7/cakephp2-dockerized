COMPOSE=docker-compose -f docker-compose.dev.yml --env-file .env.dev

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

docker-project-init: ## Initialize project
	cp .env.example	.env.dev
	${COMPOSE} up -d --build

docker-restart:	## Restart and rebuild containers (useful when changing PHP versions)
	${COMPOSE} down
	${COMPOSE} up -d --build

docker-start:	## Start the project without re-building containers
	${COMPOSE} up -d

docker-stop:	## Stop containers
	${COMPOSE} down

docker-destroy:	## Stop containers and reset information from database
	${COMPOSE} down -v

bash:	## Enter php container
	${COMPOSE} exec php bash
