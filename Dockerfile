# choosing the base image
FROM node:10-alpine

# Create app directory
WORKDIR /app

# ensure both package.json AND package-lock.json are copied to the image
COPY package*.json ./

# install app dependencies
RUN npm install

# bundle the app source
COPY . .

#expose 3001 for the api to connect to it internally
EXPOSE 3000

#run the app once it starts
CMD ["node", "index.js"]
