#!/bin/bash -e

docker-machine create -d virtualbox bounca || true
docker-machine stop bounca || true
docker-machine start bounca || true
eval $(docker-machine env bounca)
docker-compose build
docker-compose up -d
docker-compose run bounca python3 /srv/www/bounca/manage.py migrate --noinput
echo "Visit your BounCA installation:"
docker-machine ip bounca
