FROM node:alpine

WORKDIR /app/usr
RUN apk add --update npm
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/ngnix