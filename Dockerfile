# m3u4me — self-hosted M3U playlist manager
# https://github.com/andrei-savin/m3u4me

FROM node:24-alpine

WORKDIR /app

# Install dependencies first, separately from the source copy, so this layer
# is only rebuilt when package.json/package-lock.json actually change.
#
# IMPORTANT: server.ts has a top-level `import { createServer as
# createViteServer } from "vite"` that gets evaluated even when the app is
# running in "production" mode — vite is only a devDependency, but the
# import still has to resolve. Do NOT switch this to
# `npm ci --omit=dev`, or the container will crash on boot with
# "Cannot find module 'vite'".
COPY package.json package-lock.json ./
RUN npm ci

# Copy the rest of the source and build the React frontend. `vite build`
# outputs static assets to dist/, which server.ts serves in production.
COPY . .
RUN npm run build

ENV NODE_ENV=production
# m3u4me listens on 8080 by default (see ecosystem.config.cjs); override
# with `docker run -e PORT=...` if you want a different internal port.
ENV PORT=8080
EXPOSE 8080

# Playlists, channels, EPG cache, and auth (db.json / auth.json) are stored
# as JSON under ./data — mount this so your data survives image rebuilds.
VOLUME ["/app/data"]

# The README uses PM2 as a process supervisor, but Docker's own restart
# policy (see docker-compose.yml) does that job here, so we run the server
# directly instead of installing/starting PM2 inside the container.
CMD ["node", "server.ts"]
