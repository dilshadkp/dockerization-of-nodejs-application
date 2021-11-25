FROM alpine:latest
RUN mkdir /var/nodeapp
WORKDIR /var/nodeapp
RUN apk update && apk add --no-cache nodejs npm
COPY application/ .
RUN npm install
CMD ["node" , "mynodeapp.js"]
EXPOSE 8080
