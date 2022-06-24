FROM node:18
WORKDIR /app
COPY . .
RUN npm install
ENTRYPOINT ["node", "start.js"]
EXPOSE 8080
