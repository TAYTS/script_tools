#!/bin/bash
# Setup the environment for the basic flask development
# Create multiple users with default password
# Setup the firewall


echo "LANG=en_US.UTF-8" > /etc/default/locale
echo "LANGUAGE=en_US.UTF-8" > /etc/default/locale
echo "LC_ALL=en_US.UTF-8" > /etc/default/locale
echo "LC_CTYPE=en_US.UTF-8" > /etc/default/locale

touch requirement.txt
echo "Flask" >> requirement.txt
echo "Flask-SQLAlchemy" >> requirement.txt
echo "SQLAlchemy" >> requirement.txt
echo "requests" >> requirement.txt
echo "Flask-JWT-Extended" >> requirement.txt
echo "Flask-RESTful" >> requirement.txt
echo "mysqlclient" >> requirement.txt

touch authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvlznJ4LngmXzYhDkGEXDP6jSbwRAKW6R935v85i81FJcnRzgje6wuiPiWA6ZraU+YaayMUMoR4+kplXN2TccEl6C+GzmHDDccBKqy9hiLIeo4W3l4mNPfHCAO96L3uKGKvWBhUpRHMLNapgQvnBmG2zJX1zUoe1K7+8XYHXiQxmu6zm7rw7vo0diX7pLleloSgHoG58jUyuAzU7FZz0KXlRhduvKYpRLa9Z1sHKdsg3ZjX2UawXfABn0dQ/wR0Ue7dkNQWHkTOcmElMRJiUX2CgMX9udZ890XrwcI/OEzGUCTchKvsZ0AnHkI+Dv4a2mwdTL8shv3rlNtJ+mc/oef" >> authorized_keys

for value in {1..10}
do
sudo adduser flask$value<<EOF
flask
flask





y
EOF
mkdir -p /home/flask$value/.ssh
cat authorized_keys > /home/flask$value/.ssh/authorized_keys
sudo chmod 604 /home/flask$value/.ssh/authorized_keys

done

sudo apt-get update
sudo apt-get install -y python3-pip
sudo apt-get install -y python-mysqldb
sudo apt-get install -y mysql-server
sudo apt-get install -y libmysqlclient-dev
sudo pip3 install -r requirement.txt
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw allow 5000:6000/tcp

rm authorized_keys
rm requirement.txt
