build:
		@{ \
			git submodule update --init --recursive; \
			docker compose -f ./docker/docker-compose.yaml build; \
		}

start:
		@{ \
			docker compose -f ./docker/docker-compose.yaml up --build -d; \
			echo "Waiting for MySQL to start..."; \
			sleep 10; \
			bash docker/snapshot-hub/db.sh; \
			bash docker/snapshot-sequencer/db.sh; \
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
