FROM node:latest

# Provides cached layer for node_modules
ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /src && cp -a /tmp/node_modules /src/

# Define working directory
WORKDIR /src
ADD . /src

ENV PORT 8080
ENV MONGODB=mongodb://crossdb:27017/Cross
ENV CLIENT_ORIGIN=http://192.168.5.166/jsmetta

# Expose port
EXPOSE  8080

# Run app using nodemon
CMD ["node", "/src/server.js"]