FROM node:10
WORKDIR /root/
COPY ./my-app/dist ./my-app/dist
COPY package*.json ./
RUN npm install
COPY server.js .
EXPOSE 3080
CMD ["node","server.js"]