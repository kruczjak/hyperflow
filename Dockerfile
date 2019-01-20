FROM node:8.15-alpine

WORKDIR /usr/src/app

COPY package.json .

RUN npm install

COPY . .

ENV PORT=80

EXPOSE ${PORT}

CMD [ "npm", "start" ]
