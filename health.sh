printf "Hub: "
curl http://localhost:3000/api
printf "\n"

printf "Sequencer: "
curl http://localhost:3001
printf "\n"

printf "Scores: "
curl http://localhost:3003
printf "\n"

printf "MySQL: "
curl http://localhost:3306

printf "Redis: "
curl http://localhost:6379/check
printf "\n"