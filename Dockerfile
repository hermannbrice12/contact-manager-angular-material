FROM node
RUN apt-get update
WORKDIR /usr/app
COPY . ./
RUN npm install
RUN npm run build
EXPOSE 4200
CMD ["npm", "run", "start"]
