FROM node:15-alpine
RUN apk update && apk add python make g++
WORKDIR /opt/app

# install app dependencies
COPY package*.json ./
COPY config-overrides.js ./
RUN npm install

COPY . ./
RUN npm run build

CMD ["npx", "serve", "build"]
