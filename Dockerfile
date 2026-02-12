<<<<<<< HEAD
# Use a small, supported Node base image and use the exec form for CMD
FROM node:18-alpine
=======
# Multi-stage build for Stampcoin Platform

# Stage 1: Build
FROM node:18-alpine AS builder
>>>>>>> a4f0e2ee76d23aa5eaf9d56063365761bc958a18

WORKDIR /app

# Copy package files
COPY package.json package-lock.json ./

<<<<<<< HEAD
# Use npm ci for reproducible installs when package-lock.json exists.
# Install only production deps to keep image small.
RUN npm ci --only=production && npm cache clean --force
=======
# Install dependencies
RUN npm ci
>>>>>>> a4f0e2ee76d23aa5eaf9d56063365761bc958a18

# Copy application files
COPY . .

# Build application
RUN npm run build

<<<<<<< HEAD
# Set environment variables for production
ENV NODE_ENV=production
ENV PORT=8080
ENV HOST=0.0.0.0
EXPOSE 8080

# Add health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3   CMD curl -f http://localhost:8080/sync || exit 1

# Exec form — this avoids shell parsing problems seen in your logs
=======
# Stage 2: Runtime
FROM node:18-alpine

WORKDIR /app

# Install production dependencies only
COPY package.json package-lock.json ./
RUN npm ci --only=production

# Copy built application from builder
COPY --from=builder /app/public ./public
COPY server.js wallet.js market.js utils.py ./

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD node -e "require('http').get('http://localhost:8080', (r) => {if (r.statusCode !== 200) throw new Error(r.statusCode)})"

# Start application
>>>>>>> a4f0e2ee76d23aa5eaf9d56063365761bc958a18
CMD ["node", "server.js"]
