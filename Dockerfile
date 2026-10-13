FROM node:18

RUN apt-get update && apt-get install -y graphicsmagick && apt-get clean

WORKDIR /app

COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
RUN npm install
COPY . /app



CMD ["sh", "-c", "mkdir -p /data/credentials /data/instances /data/logs /data/maps && rm -rf /app/credentials /app/instances /app/logs /app/maps && ln -s /data/credentials /app/credentials && ln -s /data/instances /app/instances && ln -s /data/logs /app/logs && ln -s /data/maps /app/maps && npm start"]
