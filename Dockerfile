FROM node:alpine
WORKDIR '/app'

COPY package*.json ./
RUN npm install
COPY ./ ./

RUN npm run build

FROM nginx:alpine
EXPOSE 80
COPY --from=0 /app/build /var/www/html
RUN rm /etc/nginx/conf.d/default.conf
COPY --from=0 /app/nginx/nginx.conf /etc/nginx/conf.d/default.conf


