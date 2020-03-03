# Backend

This is the backend documentation.

## Releases

You can find here what are the latest [releases](./markdown/Releases.md)

## Containers

### Use

We're using containers to host our different backend part. We try to split functionnalities as much as possible within the limit of logic. As soon as a backend func can and should work separately from the others then it should be separated in a different containers

### Orchestration

Currently we're using docker-compose for our backend, but soon we should use kubernetes in order to manage scalability, availbaility and so on... Also, we'll have to implement a load balancer.

### Documentations

#### Auth server

This container handles all that has to do with user authentication. You can find the [api doc here](./authentication/Readme.md)

#### Web-app

This container handles everything that has to do with creating fetching deleting bars, events... Everything that has to do with our core app items. You can find the [api doc here](./web-app/Readme.md)

## Middlewares

Most of our services use middlewares (files are present in the folder). Those are just bits of code, functions that you pass on before actually accepting any request to check if a user is authed f.eg. This allows you to reuse those functions over and over while maintaining a clean code-base.

## Launch project

With docker installed and while being in the backend directory

```
docker-compose start --build
```

Then the different containers are available at your local IP, with the given ports in the `docker-compose.yml` file. You might have to open those ports to on firewall if you want your local server to be accessible from your local wifi network. 

## Contributing

Try to keep your code as clean as possible and don't push any modification that isn't documented using docstrings.

Plz also document your work in the [releases](./markdown/Releases.md) file
