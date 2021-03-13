FROM node:alpine as build
WORKDIR '/app'

COPY package*.json ./
RUN npm install
COPY ./ ./

RUN npm run build

FROM nginx:alpine
COPY /nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build /usr/share/ngnix/html

