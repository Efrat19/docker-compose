<span align="right"><img src="https://github.com/Efrat19/docker-compose/master/docker-compose.svg"></span>
<p align="center"></p>

### This project is:

##### A docker environment example. the docker-compose.yml file includes 3 services:
 - frontend: basic vuejs client.
 - backend: php-laravel server.
 - database: mysql:5.7 image.
 
 ### What is it actually doing?
 
 ##### the server container gets access (using [docker volumes](https://docs.docker.com/storage/volumes/)) to the host docker/containers library,
 ##### stores them in the database and send to the client a visual display
 ##### of the currently running containers.
 
 ### How to run it?
 
 ##### Run `./run.sh up` to start.
 ##### See the result at `localhost:8080`.
 ##### When your done, run `./run.sh down`
 
 ###### This project was created and tested on linux/ubuntu16.04.5.
 ###### Its using 1 DockerHub image- the official mysql:5.7 image, and 2 local Dockerfiles.
 ###### for basic vuejs and laravel Dockerfiles, checkout my repos:
  - [laravel-Dockerfile-template](https://github.com/Efrat19/laravel-Dockerfile-template)
  - [vuejs-Dockerfile-template](https://github.com/Efrat19/vuejs-Dockerfile-template)