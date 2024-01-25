#docker exec -i snapshot-hub mysql -h snapshot-mysql -u admin -p -P 3306 -D snapshot
## msyql [snapshot]: source src/helpers/schema.sql

#!/bin/bash

# Variables
CONTAINER_NAME="snapshot-seq"
DB_NAME="snapshot"          
DB_USER="root"          
DB_PASSWORD="pwd"      
SQL_FILE="./modules/snapshot-sequencer/src/helpers/schema.sql"

# Copy the SQL file to the container
docker cp "$SQL_FILE" "$CONTAINER_NAME":/home/node/app/schema-seq.sql

# Execute the SQL file in the container
docker exec -i "$CONTAINER_NAME" /bin/bash -c "mysql -h snapshot-mysql -u $DB_USER -p$DB_PASSWORD $DB_NAME < schema-seq.sql"

# # Optional: Remove the SQL file from the container after execution
# # docker exec -i "$CONTAINER_NAME" rm /schema.sql

# echo "Schema loaded into the MySQL database successfully."