FROM mhart/alpine-node:10

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm install

# Bundle app source
COPY ./src ./src
COPY ./tsconfig.json .

RUN npm run build

EXPOSE 3000
CMD [ "npm", "run", "start" ]