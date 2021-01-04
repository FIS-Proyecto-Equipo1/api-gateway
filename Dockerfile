FROM node:9-alpine

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm install

COPY /config ./config

ENV PORT=80
EXPOSE 80

CMD npm start