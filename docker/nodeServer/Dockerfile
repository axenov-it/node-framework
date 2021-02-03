# base image
FROM node:latest

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

RUN npm i nodemon -g

RUN npm install pm2@latest -g

RUN apt-get update && apt-get install iputils-ping

COPY package.json .

COPY yarn.lock .

RUN yarn

# start app
CMD ["sh","-c","./docker/nodeServer/run.sh"]