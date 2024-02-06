FROM node:18-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache git py3-pip python3 gcc g++ make jq

WORKDIR /app

COPY package.json .
COPY yarn.lock .

# Temporarily remove the preinstall script from package.json
RUN jq 'del(.scripts.preinstall)' package.json > temp.json && mv temp.json package.json

RUN yarn install --frozen-lockfile

COPY . .

RUN yarn run build

EXPOSE 8080

CMD ["yarn", "run", "dev", "--host"]
