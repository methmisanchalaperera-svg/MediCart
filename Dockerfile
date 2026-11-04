FROM node:20-alpine

WORKDIR /app

# Copy backend dependency files
COPY server/package*.json ./server/

# Install backend dependencies
RUN npm ci --prefix server --omit=dev

# Copy backend source code
COPY server ./server

ENV PORT=3000

EXPOSE 3000

USER node

CMD ["node", "server/src/index.js"]
