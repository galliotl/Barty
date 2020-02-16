# Barty - Authentication server

This folder contains an expressJs app. It'll later be used to authenticate our users. We're using docker to run our app and the docker container can be created using the cmd:

`docker build . -t auth_server`

Then run it using 

`docker run -p 8080:3000 --name auth auth_server`


More info about the [build command](https://docs.docker.com/engine/reference/commandline/build/) here!

More informations about the [run command](https://docs.docker.com/engine/reference/commandline/run/) here!

## Releases

### 0.0.0 - Skeleton

The service is not nearly functionnal but some of the features s.as hashing with salt are already present
