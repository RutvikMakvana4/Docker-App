# Build Stage
FROM node:18 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Transpile using Babel
RUN npm run build

# Production Stage
FROM node:18

WORKDIR /app

COPY --from=builder /app/package*.json ./
RUN npm install --only=production

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/.env.production .env

EXPOSE 4001

CMD ["node", "dist/app.js"]
