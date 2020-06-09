FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

FROM nginx 
EXPOSE 80 
#For elastic beanstalk to open the port
COPY --from=builder /app/build /usr/share/nginx/html
