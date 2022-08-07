# BUILD STAGE WITH NODE/NPM
FROM node:14-alpine3.16 as build

# COPY IN PROJECT TO CONTAINER IMAGE
COPY . .
 
# INSTALL BUILD DEPS
RUN npm ci

#SET NODE_ENV TO BUILD FOR PRODUCTION
ENV NODE_ENV=production

#BUILD DIST FOLDER
RUN npm run build

# NGINX alpine distribution base image
FROM nginx:latest

#COPY ROOT DIST FOLDER
COPY --from=build dist/ /usr/share/nginx/html

# ADD OUR NGINX CONFIGURATION FILE TO SERVE OUR HTML PAGE
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 5000