#first stage
#FROM node:16-alpine as builder
#WORKDIR '/app'
#COPY package.json .
#RUN  npm install
#COPY . .
#RUN npm run build


# sec stage
# /app/build --> all the stuff we care about
#FROM nginx
# copy --from=stage name  folder we want to copy then where we want to copy it on the prod server
#COPY --from=builder /app/build  /usr/share/nginx/htnl

FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
