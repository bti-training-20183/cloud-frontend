FROM node:lts-alpine
COPY . /app
WORKDIR /app
RUN npm install -g nuxt --save
RUN npm install -g
RUN npm run build
EXPOSE 3000
CMD ["npm", "start"]