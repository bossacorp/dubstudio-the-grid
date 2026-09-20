FROM node:20-alpine
WORKDIR /app

COPY server/package*.json ./server/
RUN npm install --prefix server --omit=dev

COPY server ./server
COPY web ./web

EXPOSE 8080
CMD ["node", "server/src/index.js"]
