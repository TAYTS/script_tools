#!/bin/bash
# Create multiple mysql user and database
# Arg1: root password

for value in {1..50}
do
mysql -u root --password='$1'<<SCRIPT
CREATE DATABASE USER$value;
CREATE USER 'USER$value'@'%' IDENTIFIED BY '-FW5exc3FKwpTLLBQD)3j-4QO_2/';
GRANT ALL PRIVILEGES ON USER$value.* TO 'USER$value'@'%';
FLUSH PRIVILEGES;
SCRIPT
echo "MySQL user created."
echo "Username:   USER$value"
done
