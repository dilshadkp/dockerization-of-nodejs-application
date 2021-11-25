FROM alpine:latest
RUN mkdir /var/nodeapp
WORKDIR /var/nodeapp
COPY application/ .
RUN apk update && apk add --no-cache nodejs npm
RUN npm install
CMD ["node" , "mynodeapp.js"]
EXPOSE 8080
