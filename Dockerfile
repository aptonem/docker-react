#temp container.
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#read from builder contr. and run on real server.
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html