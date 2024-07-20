FROM node:20.15.0-alpine3.20
EXPOSE 80/tcp
ENV DB_HOST=mysql
RUN addgroup -S expense && adduser -S expense -G expense \
    && mkdir /app \
    && chown expense:expense -R /app
WORKDIR /app
COPY package.json .
COPY *.js /app/
RUN npm install
USER expense
CMD ["node", "index.js"]



