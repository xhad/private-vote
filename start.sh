docker compose -f ./docker/docker-compose.yaml up --build -d

echo "Waiting for MySQL to start..."
sleep 10
bash docker/snapshot-hub/db.sh
bash docker/snapshot-sequencer/db.sh