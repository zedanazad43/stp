# Use a small, supported Node base image and use the exec form for CMD
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Install dependencies first (cache friendly)
COPY package*.json ./

# Use npm ci for reproducible installs when package-lock.json exists.
# Install only production deps to keep image small.
RUN npm ci --only=production && npm cache clean --force

# Copy app source
COPY . .

# Use non-root user for better security (optional but recommended)
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN chown -R appuser:appgroup /app
USER appuser

# Set environment variables for production
ENV NODE_ENV=production
ENV PORT=8080
ENV HOST=0.0.0.0
EXPOSE 8080

# Add health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3   CMD curl -f http://localhost:8080/sync || exit 1

# Exec form — this avoids shell parsing problems seen in your logs
CMD ["node", "server.js"]
