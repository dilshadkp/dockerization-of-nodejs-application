# Dockerization of Nodejs application

## Indroduction

This is a documentation for dockerization of a sample Nodejs application. I used a simple Nodejs application which prints **This is My First NodeJS Application Version 1**.

I used latest version of Alpine image to create the nodeapp image and the app will run in port 8080 of the docker container.

## Prerequisites

- Need to install docker
- You need to have a basic knowledge of what is docker.

## How to install docker

Please refer the doc for [docker installation](https://docs.docker.com/engine/install)

```sh
yum install docker -y
yum install git -y
```
> you guys can use [play with Docker](https://labs.play-with-docker.com/) which includes pre-installed docker. It looks like a terminal and it's built from alpine OS. So, it's just used for learning purpose so who you guys can use 4hrs session without any additional installation.

## How to use

- Clone application from GitHub

```sh
git clone https://github.com/dilshadkp/dockerization-of-nodejs-application.git
cd dockerization-of-nodejs-application
```

- Execute *docker build* command

```sh
docker build -t nodeapp:v1 .
```
> ***nodeapp*** is the name I am giving for my docker image and ***v1*** is the image version.
> You can give those as of your choice.

## Output

```sh
$ docker build -t nodeapp:v1 .
Sending build context to Docker daemon  56.32kB
Step 1/8 : FROM alpine:latest
latest: Pulling from library/alpine
59bf1c3509f3: Pull complete 
Digest: sha256:21a3deaa0d32a8057914f36584b5288d2e5ecc984380bc0118285c70fa8c9300
Status: Downloaded newer image for alpine:latest
 ---> c059bfaa849c
Step 2/8 : RUN mkdir /var/nodeapp
 ---> Running in 15671f971505
Removing intermediate container 15671f971505
 ---> a425339a56cd
Step 3/8 : WORKDIR /var/nodeapp
 ---> Running in fa210c0cbfef
Removing intermediate container fa210c0cbfef
 ---> b72808ea685e
Step 4/8 : RUN apk update && apk add --no-cache nodejs npm
 ---> Running in d93e64333693
fetch https://dl-cdn.alpinelinux.org/alpine/v3.15/main/x86_64/APKINDEX.tar.gz
fetch https://dl-cdn.alpinelinux.org/alpine/v3.15/community/x86_64/APKINDEX.tar.gz
v3.15.0-6-g86c90add2c [https://dl-cdn.alpinelinux.org/alpine/v3.15/main]
v3.15.0-8-gdfb3ea9998 [https://dl-cdn.alpinelinux.org/alpine/v3.15/community]
OK: 15833 distinct packages available
fetch https://dl-cdn.alpinelinux.org/alpine/v3.15/main/x86_64/APKINDEX.tar.gz
fetch https://dl-cdn.alpinelinux.org/alpine/v3.15/community/x86_64/APKINDEX.tar.gz
(1/8) Installing ca-certificates (20191127-r7)
(2/8) Installing nghttp2-libs (1.46.0-r0)
(3/8) Installing brotli-libs (1.0.9-r5)
(4/8) Installing c-ares (1.18.1-r0)
(5/8) Installing libgcc (10.3.1_git20211027-r0)
(6/8) Installing libstdc++ (10.3.1_git20211027-r0)
(7/8) Installing nodejs (16.13.0-r0)
(8/8) Installing npm (8.1.3-r0)
Executing busybox-1.34.1-r3.trigger
Executing ca-certificates-20191127-r7.trigger
OK: 57 MiB in 22 packages
Removing intermediate container d93e64333693
 ---> 4ce336e65587
Step 5/8 : COPY application/ .
 ---> 330bc8594865
Step 6/8 : RUN npm install
 ---> Running in 78254759b6d8

added 50 packages, and audited 51 packages in 6s

found 0 vulnerabilities
Removing intermediate container 78254759b6d8
 ---> 0e4e8c1576c9
Step 7/8 : CMD ["node" , "mynodeapp.js"]
 ---> Running in d96e41d6a134
Removing intermediate container d96e41d6a134
 ---> ce0fdef07605
Step 8/8 : EXPOSE 8080
 ---> Running in b04f454ded22
Removing intermediate container b04f454ded22
 ---> ece2dd91f46f
Successfully built ece2dd91f46f
Successfully tagged nodeapp:v1
```
#### Docker Image list

```sh
docker image ls
REPOSITORY   TAG       IMAGE ID       CREATED              SIZE
nodeapp      v1        ece2dd91f46f   About a minute ago   60.2MB
alpine       latest    c059bfaa849c   22 hours ago         5.59MB
```

## Running a Docker container with the created image

```sh
docker container run --name demo -d -p 80:8080 nodeapp:v1

```
```sh
$ docker ps
CONTAINER ID   IMAGE        COMMAND               CREATED          STATUS         PORTS                  NAMES
902678a89926   nodeapp:v1   "node mynodeapp.js"   15 seconds ago   Up 5 seconds   0.0.0.0:80->8080/tcp   demo
```

## Sample Screenshot
![](https://i.ibb.co/0VYwbS1/site.png)

## Behind the code

```
FROM alpine:latest   <<====================================   Pull latest version of alpine image from hub
RUN mkdir /var/nodeapp   <<================================   Create a directory */var/nodeapp* 
WORKDIR /var/nodeapp    <<=================================   Change working directory to */var/nodeapp*
COPY application/ .    <<==================================   Copy application to working directory
RUN apk update && apk add --no-cache nodejs npm    <<======   Install required packages
RUN npm install    <<======================================   Install dependencies specified in *package.json*
CMD ["node" , "mynodeapp.js"]    <<========================   Set default command for the image
EXPOSE 8080    <<==========================================   Expose port 8080
```

x------------------x---------------------x---------------------x-------------------x--------------------x---------------------x-------------------x

### ⚙️ Connect with Me 

<p align="center">
<a href="mailto:dilshad.lalu@gmail.com"><img src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white"/></a>
<a href="https://www.linkedin.com/in/dilshadkp/"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"/></a> 
<a href="https://www.instagram.com/dilshad_a.k.a_lalu/"><img src="https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white"/></a>
<a href="https://wa.me/%2B919567344212?text=This%20message%20from%20GitHub."><img src="https://img.shields.io/badge/WhatsApp-25D366?style=for-the-badge&logo=whatsapp&logoColor=white"/></a><br />
