### STAGE 1: Build ###
FROM node:12.7-alpine AS build
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build
### STAGE 2: Run ###
FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=node /usr/src/app/dist/app /usr/share/nginx/html



#FROM node:lts
# set working directory
#WORKDIR /app
# copy and install app dependencies
#COPY . /app
#RUN npm install
#RUN npm install -g @angular/cli@7.2.1
# add app
#EXPOSE 3001
# start app
#CMD ["ng",  "serve", "--host", "0.0.0.0"]
