#!/bin/bash


# Check if tooling.sql file exists
if [[ ! -f "tooling.sql" ]]; then
  echo "Error: tooling.sql file not found in the current directory."
  exit 1
fi

# Retrieve the Aurora endpoint from Terraform output
DB_HOST=$(terraform output -raw aurora_endpoint)

# Define database connection details
DB_NAME="tooling_db"       
DB_USER="admin"            
DB_PASSWORD="" 

# Display connection details for verification
echo "Connecting to Amazon Aurora with the following details:"
echo "DB_HOST: $DB_HOST"
echo "DB_NAME: $DB_NAME"
echo "DB_USER: $DB_USER"

# Load the schema into Aurora
echo "Loading schema from tooling.sql into $DB_NAME..."
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" < tooling.sql

# Verify if the schema was loaded successfully
if [[ $? -eq 0 ]]; then
  echo "Schema loaded successfully into $DB_NAME."
else
  echo "Error loading schema into $DB_NAME."
  exit 1
fi
