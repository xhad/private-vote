build:
		@{ \
			git submodule update --init --recursive; \
			docker compose -f ./docker/docker-compose.yaml build; \
		}

start:
		@{ \
			echo "Starting databases..."; \
			docker compose -f ./docker/docker-compose.yaml up --build -d snapshot-mysql redis keycard-mysql; \
			echo "Waiting for databases to be ready..."; \
			sleep 10; \
			echo "Starting servers..."; \
			docker compose -f ./docker/docker-compose.yaml up --build -d keycard snapshot-seq score-api; \
			sleep 10; \
			docker compose -f ./docker/docker-compose.yaml up --build -d snapshot-hub; \
			echo "Waiting for servers to start..."; \
			sleep 10; \
			bash docker/snapshot-hub/db.sh; \
			bash docker/snapshot-sequencer/db.sh; \
			sleep 5; \
			echo "Starting interface..."; \
			docker compose -f ./docker/docker-compose.yaml up --build -d snapshot-interface; \
		}

pause:
		@{ \
			docker compose -f ./docker/docker-compose.yaml stop; \
		}

stop:
		@{ \
			docker compose -f ./docker/docker-compose.yaml down; \
		}

logs:
		@{ \
			docker compose -f ./docker/docker-compose.yaml logs -f; \
		}

check:
		@{ \
			curl http://localhost:3000/api && printf " Hub " && printf "\033[0;32m✔\033[0m\n" || printf "\033[0;31m✘\033[0m\n"; \
			curl http://localhost:3001 &&  printf " Sequencer " && printf "\033[0;32m✔\033[0m\n" || printf "\033[0;31m✘\033[0m\n"; \
			curl http://localhost:3003 &&  printf " Scores " && printf "\033[0;32m✔\033[0m\n" || printf "\033[0;31m✘\033[0m\n"; \
		}
 
 restart: 
		@{ \
			make stop; \
			make start; \
		}