FROM mhart/alpine-node

WORKDIR /app

ADD package.json /app/package.json

RUN npm install --production

# Removing large unnecessary files until my PR is accepted:
RUN rm -rf /app/node_modules/docker-events/node_modules/jsuck/node_modules/clarinet/samples && \
    rm -rf /app/node_modules/docker-events/node_modules/jsuck/node_modules/clarinet/bench && \
    rm -rf /app/node_modules/docker-events/node_modules/jsuck/node_modules/clarinet/test

ADD . /app

ENV PORT 5005

EXPOSE 5005

CMD ["node", "index.js"]
