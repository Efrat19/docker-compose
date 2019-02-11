<p align="center"></p>

### Get ready:
- make sure port 8080 is clear.

### Grab my image:
- to pull the existing image
  run `docker pull efrat19/vuejs`
  #### OR
  
- to build from the local Dockerfile:
  - make sure you're inside the project directory
  -  run `docker build -t <whatever> .`
  
### Show Time:
- run `docker container run -d -p 8080:8080 --name vuejs_1 efrat19/vuejs`
- open your browser at localhost:8080 to see the result


###### when you're done:
### Cleanup the mess:
`docker container rm -f vuejs_1`
