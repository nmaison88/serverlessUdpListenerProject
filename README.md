# SERVERLESS UDP LISTENER
```
 _____ ___________ _   _ ___________ _     _____ _____ _____   _    _____ _____ _____ _____ _   _ ___________ 
/  ___|  ___| ___ \ | | |  ___| ___ \ |   |  ___/  ___/  ___| | |  |_   _/  ___|_   _|  ___| \ | |  ___| ___ \
\ `--.| |__ | |_/ / | | | |__ | |_/ / |   | |__ \ `--.\ `--.  | |    | | \ `--.  | | | |__ |  \| | |__ | |_/ /
 `--. \  __||    /| | | |  __||    /| |   |  __| `--. \`--. \ | |    | |  `--. \ | | |  __|| . ` |  __||    / 
/\__/ / |___| |\ \\ \_/ / |___| |\ \| |___| |___/\__/ /\__/ / | |____| |_/\__/ / | | | |___| |\  | |___| |\ \ 
\____/\____/\_| \_|\___/\____/\_| \_\_____|____/\____/\____/  \_____|___/\____/  \_/ \____/\_| \_|____/\_| \_|
```                                                                                                  
                                                                                                                                                                                                        
this application stack, will set up an ec2 instance, sqs, dynamodb and lambda for a basic udp listener setup.

## what does it do? 
it takes in udp packet data and stores it into an sqs queue for consumption on the queue worker lambda which will then take the messages, parse the data and store into a dynamo database. 

## local Environment Setup

### Prerequisites

1. install [Homebrew](http://brew.sh)
    ```bash 
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/homebrew/install/HEAD/install.sh)"
    ```
2. Homebrew Packages

    1.install [Node](https://nodejs.org/en/) and [Docker](https://docs.docker.com/)
    ```bash 
    # install node
    brew install node
    # install docker
    brew install --cask docker
    ```
3. install [lerna](https://github.com/lerna/lerna)
    ```bash
    npm install -g lerna
    ```


### Running inside of docker

* Make sure you have installed Docker, see pre-requisites
 
export the env vars required for docker to run, these are the .env vars

```bash 
export AWS_ACCESS_KEY_ID=<key id here>
export AWS_SECRET_ACCESS_KEY=<secret key Here>
export ENVIRONMENT=<environment here>
```
### Build docker images and start instance

```bash
docker-compose up --build
```

### find the name of the running docker conrainers

```bash
docker ps
```

### Enter an existing and running docker container

```bash
docker exec -it <name od container> /bin/sh
```

### Running Tests inside of the Container

```bash
# Run all services tests
npx lerna run test

# run an individual services tests
cd services/<service name>
yarn run test

```

### Stopping a Docker Container Instance 

```bash
# run where the dockerfile is located
docker-compose down
# alternatively 

docker stop <name of container>


```
you can use `docker ps` to find out if a docker instance is running, leaving it running can be a drain on your machines resource and block ports used by other applications.

