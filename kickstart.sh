#!/bin/bash
sudo echo 'Hello World!' > /home/azadmin/hello.txt
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt-cache policy docker-ce
sudo apt install -y docker-ce
sudo systemctl enable --now docker
cd /home/azadmin/web
sudo docker build . -t web-53
sudo docker run --restart=always -p 8080:8080 -d --name web-53 --network=bridge web-53
sudo docker run -d --name redis -p 6379:6379 --network=bridge --restart=always redis
sudo docker run --name traefik --network=bridge --restart=always -p 5000:8080 -p 80:80 -d -p 443:443 --mount type=bind,source=/home/azadmin/web/traefik.yml,target=/etc/traefik/traefik.yml --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock --mount type=bind,source=/home/azadmin/web/dynamic_conf.yml,target=/etc/traefik/dynamic_conf.yml --mount type=bind,source=/home/azadmin/web/supercert.pem,target=/etc/traefik/supercert.pem --mount type=bind,source=/home/azadmin/web/supercert.key,target=/etc/traefik/supercert.key traefik:v2.4
