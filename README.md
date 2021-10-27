# min-psql-docker-container

## WHAT IS THIS ?!
Ubuntu 20.04 based postgres 11 client & server docker image source + build code

## Prerequisites
- Make
- Docker 

## USAGE & HELP
Is possible to show all available make actions calling:
```bash
make help
# or
make
```

## ENVIRONMENTS
```bash
ENV=lde # the local development environment switch - installs the postgres server and the client
ENV=foobar # the local development environment switch - installs ONLY the postgres client psql
```


## INSTALL
Build an ubuntu 20.04 image and initialize a container with all required dependencies:
```bash

# build the docker img with cache
ENV=lde make install-psql-client-docker-img

# build the docker img with no cache
ENV=lde make install-psql-client-docker-img-no-cache
```

## PUBLISH TO THE DOCKER hUB


```bash
docker login # use your DockerHub username & pw

docker tag psql-client-docker-img-psql-client-docker-img-img:latest your_dockerhub_usr/dockerhub:psql-client-docker-img-psql-client-docker-img-img
# push it
docker push your_dockerhub_usr/dockerhub:psql-client-docker-img-psql-client-docker-img-img
```

