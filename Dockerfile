FROM node:14 AS builder
RUN apt-get update
WORKDIR /usr/app
COPY package*.json ./
RUN npm install
COPY . ./
RUN npm run build

FROM nginx:stable-alpine
COPY --from=builder /usr/app/dist/angularmaterial/ /usr/share/nginx/html/
