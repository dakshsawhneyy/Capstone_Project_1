#!/bin/bash

sudo apt update 
sudo apt-get install docker.io docker-compose-v2 -y

sudo systemctl enable dockerr
sudo systemctl start docker
r
sudo usermod -aG docker $USER && newgrp docker