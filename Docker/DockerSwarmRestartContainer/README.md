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

# Note for the willfarrell/autoheal image

    This example is using willfarrell/autoheal image to restart the unhealth container, here will record some concept for willfarrell/autoheal image.

    In the willfarrell/autoheal image it leverage the below cli to get container information
        - curl --unix-socket /var/run/docker.sock -s http://localhost/containers/json
        - base on the above cli, we can get the below informaiton for each container

        ```json
        {
            "Id": "9eeb865f0cfee5d17697821fed391256dd47e85e57bc55b87dbc294a52910d6d",
            "Names": [
                "/fastapi-test_fastapi.1.v8kghhrq6frs7trjchsnmh6p9"
            ],
            "Image": "fastapi-healthcheck:latest",
            "ImageID": "sha256:7a5d45935b249b3dcf3a9bc26f5a938817621d1c5c64de4f8bb2546e88b6e1e2",
            "Command": "uvicorn app:app --host 0.0.0.0 --port 8000",
            "Created": 1735742406,
            "Ports": [
                {
                    "IP": "0.0.0.0",
                    "PrivatePort": 8000,
                    "PublicPort": 8000,
                    "Type": "tcp"
                },
                {
                    "IP": "::",
                    "PrivatePort": 8000,
                    "PublicPort": 8000,
                    "Type": "tcp"
                }
            ],
            "Labels": {
                "com.docker.stack.namespace": "fastapi-test",
                "com.docker.swarm.node.id": "mxtx128jmey8x5y2oatu4o7rq",
                "com.docker.swarm.service.id": "ycoly99ss6dy52dvrdf5wolr8",
                "com.docker.swarm.service.name": "fastapi-test_fastapi",
                "com.docker.swarm.task": "",
                "com.docker.swarm.task.id": "v8kghhrq6frs7trjchsnmh6p9",
                "com.docker.swarm.task.name": "fastapi-test_fastapi.1.v8kghhrq6frs7trjchsnmh6p9"
            },
            "State": "running",
            "Status": "Up 19 seconds (health: starting)",
            "HostConfig": {
                "NetworkMode": "default"
            },
            "NetworkSettings": {
                "Networks": {
                    "fastapi-test_default": {
                        "IPAMConfig": {
                            "IPv4Address": "10.0.8.9"
                        },
                        "Links": null,
                        "Aliases": null,
                        "NetworkID": "opypifbfg95uljzqhsiafa0ug",
                        "EndpointID": "64e6160b3e28de5d18cd9b3e772148e650e7706fbfada35fbf96dc3259a88168",
                        "Gateway": "",
                        "IPAddress": "10.0.8.9",
                        "IPPrefixLen": 24,
                        "IPv6Gateway": "",
                        "GlobalIPv6Address": "",
                        "GlobalIPv6PrefixLen": 0,
                        "MacAddress": "02:42:0a:00:08:09",
                        "DriverOpts": null
                    }
                }
            },
            "Mounts": []
        }
        ```
        - Than use the jq to extract the CONTAINER_ID, CONTAINER_NAME, CONTAINER_STATE data, finally decide the container need to restart or not, the rule will list as below
            - if "$CONTAINER_NAME" = "null" --> which implies container does not exist - don't restar
            - if "$CONTAINER_STATE" = "restarting --> found to be restarting - don't restart
            - else restart container
