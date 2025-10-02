# Use a small base image
FROM node:18-alpine AS base

WORKDIR /app

# Install deps separately for caching
COPY package.json package-lock.json* ./

# Install deps
RUN npm ci --omit=dev

# Copy app source
COPY . .

# Run as non-root (alpine node image includes user 'node')
USER node

# Expose the port the app runs on
EXPOSE 3000

# Set environment variables
ENV NODE_ENV=production

CMD ["npm", "start"]