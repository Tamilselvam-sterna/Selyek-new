FROM --platform=linux/amd64 node:19.4-alpine3.17 AS builder

RUN apk add --update g++ make openssl1.1-compat python3 py3-pip

WORKDIR /app/builder


RUN npm ci

COPY . .

FROM --platform=linux/amd64 node:19.4-alpine3.17

EXPOSE 4000

CMD ["serve", "-s", "."]
