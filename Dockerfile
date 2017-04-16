FROM node:6.10.2-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh && \
    git clone -b server https://github.com/recruit-tech/todo-manager.git && \
    apk del bash git openssh

WORKDIR /todo-manager
RUN npm set progress=false && npm install && npm install body-parser
EXPOSE 3000

CMD ["npm","start"]
