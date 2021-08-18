#all this will be named builder phase
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . . 

RUN  npm run build 

#this will be second phase 
FROM nginx
#copy from previous phase builder to ngnix specific location that it needs
COPY --from=builder /app/build /usr/share/nginx/html
