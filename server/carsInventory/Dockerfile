FROM node:18.12.1-bullseye-slim
RUN npm install -g npm@9.1.3 && mkdir /app && mkdir /app/data
WORKDIR /app
COPY ./package.json .
COPY ./inventory.js .
COPY ./app.js .
COPY ./data/car_records.json /app/data/car_records.json
RUN npm install
EXPOSE 3050
CMD ["node", "app.js"]