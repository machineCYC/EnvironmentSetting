# Introduce

This folder will show an example that used the willfarrell/autoheal image to restart the unhealthy container.

The pplicaiton is build a simple FastAPI app with a /health endpoint for the health check.

In /health endpoint will randomly simulate an unhealthy state for testing, Docker will mark the container as unhealthy.
Swarm will automatically restart the container after the retries fail.

# init the docker swarm

- docker swarm init

in WSL may need consider the bleow method

- docker swarm init --advertise-addr 172.19.140.89

# build applicaiton docker image

- docker build -t fastapi-healthcheck .

# run container with docker swarm

- docker stack deploy -c docker-compose.yml fastapi-test

# show docker swarm service list

- docker service ls

# show applicaiton service

- docker service ps fastapi-test_fastapi

# show docker container logs

- docker logs <container name>
    - e.g. docker logs fastapi-test_fastapi.1.g5kbcswshjjd50g5vqekjxyo1

# stop container in docker swarm

- docker stack rm fastapi-test

# check the container

 - docker inspect <container id> | grep Health
    - e.g. docker inspect 42e2c8572555 | grep Health

# docker force service restart

- docker service update --force <service_name>