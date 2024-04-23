FROM node:latest
WORKDIR /app
COPY package*.json app.js ./
COPY . .
EXPOSE 5000
CMD ["node", "app.js"]