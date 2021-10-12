FROM node:12

ENV NAME=spot

WORKDIR /usr/src/app
COPY package*.json ./

RUN npm install
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]
