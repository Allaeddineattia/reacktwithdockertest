FROM node as build

WORKDIR /app
COPY ./package.json .
RUN npm i
COPY . .
RUN npm run build

FROM nginx:1.17.6
COPY --from=build /app/build /usr/share/nginx/html