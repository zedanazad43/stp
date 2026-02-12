# Deployment Guide - دليل النشر

## Overview / نظرة عامة

This guide covers all deployment options for the Stampcoin Platform including Docker, GitHub Pages, and cloud platforms.

يغطي هذا الدليل جميع خيارات النشر لمنصة Stampcoin بما في ذلك Docker و GitHub Pages والمنصات السحابية.

---

## Table of Contents / جدول المحتويات

1. [Local Development](#local-development)
2. [Docker Deployment](#docker-deployment)
3. [GitHub Actions CI/CD](#github-actions-cicd)
4. [GitHub Pages Deployment](#github-pages-deployment)
5. [Cloud Platform Deployment](#cloud-platform-deployment)
6. [Environment Variables](#environment-variables)

---

## Local Development

### Prerequisites / المتطلبات الأساسية

- Node.js >= 16.x
- npm or yarn
- Git

### Installation / التثبيت

```bash
# Clone the repository
git clone https://github.com/zedanazad43/stp.git
cd stp

# Install dependencies
npm install

# Start the development server
npm run dev
```

The server will start on `http://localhost:8080`

---

## Docker Deployment

### Build Docker Image / بناء صورة Docker

```bash
# Build the Docker image
docker build -t stampcoin-platform .

# Or use npm script
npm run docker:build
```

### Run Docker Container / تشغيل حاوية Docker

```bash
# Run the container on port 8080
docker run -d -p 8080:8080 --name stampcoin stampcoin-platform

# Or use npm script
npm run docker:run
```

### Docker Compose (Optional)

Create a `docker-compose.yml` file:

```yaml
version: '3.8'

services:
  stampcoin:
    build: .
    ports:
      - "8080:8080"
    environment:
      - PORT=8080
      - SYNC_TOKEN=${SYNC_TOKEN}
    volumes:
      - ./data:/app/data
    restart: unless-stopped
```

Run with:
```bash
docker-compose up -d
```

### Verify Docker Deployment / التحقق من نشر Docker

```bash
# Check container status
docker ps

# Check logs
docker logs stampcoin

# Test the API
curl http://localhost:8080/api/market/items
curl http://localhost:8080/api/wallets
```

---

## GitHub Actions CI/CD

The repository includes automated workflows for building and deploying:

### 1. Build and Push Workflow

**File**: `.github/workflows/build-and-test.yml`

**Triggers**: Pushes to `main` and `develop` branches, PRs to `main`

**Actions**:
- Runs tests and linting
- Builds Docker image
- Pushes to GitHub Container Registry (ghcr.io)
- Deploys to Render (on push to main)

**Usage**:
```bash
# The workflow runs automatically on push to main or develop
git push origin main
git push origin develop
```

**Access the image**:
```bash
docker pull ghcr.io/zedanazad43/stampcoin-platform:latest
```

### 2. Render Deployment Configuration

**File**: `render.yaml`

This file defines the service configuration for Render deployment.

**Features**:
- Node.js runtime environment
- Docker-based deployment
- Health checks
- Environment variables configuration

**Manual Deployment**:
1. Create a Render account at [https://render.com/](https://render.com/)
2. Connect your GitHub repository to Render
3. Create a new Web Service from your repository
4. The service will use the `render.yaml` configuration

**Environment Variables**:
- `NODE_ENV`: Set to "production"
- `PORT`: Render uses port 10000 by default
- `SYNC_TOKEN`: Required for authentication in production

### 2. GitHub Pages Deployment

**File**: `.github/workflows/deploy.yml`

**Triggers**: Pushes to `main` branch

**Actions**:
- Builds static site
- Deploys to GitHub Pages
- Available at: `https://zedanazad43.github.io/stp/`

### 3. Pages Configuration

**File**: `.github/workflows/pages.yml`

Additional GitHub Pages configuration for static content.

---

## GitHub Pages Deployment

### Enable GitHub Pages

1. Go to repository **Settings**
2. Navigate to **Pages** section
3. Select source: **GitHub Actions**
4. Save settings

### Manual Trigger

```bash
# Commit and push to trigger deployment
git add .
git commit -m "Deploy to GitHub Pages"
git push origin main
```

### Verify Deployment

Visit: `https://zedanazad43.github.io/stp/`

---

## Cloud Platform Deployment

### Railway.app

1. Create account at [Railway.app](https://railway.app)
2. Create new project from GitHub repository
3. Configure environment variables:
   - `PORT`: 8080 (or Railway will auto-assign)
   - `SYNC_TOKEN`: Your secure token

4. Deploy automatically on push

### Fly.io

```bash
# Install Fly CLI
curl -L https://fly.io/install.sh | sh

# Login to Fly
fly auth login

# Initialize and deploy
fly launch

# Deploy updates
fly deploy
```

### Render.com

1. Create account at [Render.com](https://render.com)
2. Create new Web Service
3. Connect GitHub repository
4. Configure:
   - **Build Command**: `npm ci`
   - **Start Command**: `node server.js`
   - **Environment**: Node
   - **Port**: 10000 (Render default)

Alternatively, you can use the `render.yaml` file for automated configuration:
1. Create a new Web Service
2. Select "Configure with render.yaml"
3. The service will automatically use the configuration in the repository

### Heroku

```bash
# Install Heroku CLI
npm install -g heroku

# Login
heroku login

# Create app
heroku create stampcoin-platform

# Deploy
git push heroku main

# Open app
heroku open
```

### AWS/Azure/GCP

For cloud deployment:
1. Use container service (ECS, Container Apps, Cloud Run)
2. Push Docker image to container registry
3. Configure service with environment variables
4. Set up load balancer and DNS

---

## Environment Variables

### Required Variables

```bash
# Optional: Authentication token for sync endpoints
SYNC_TOKEN=your_secure_token_here

# Optional: Port (default: 8080)
PORT=8080
```

### Setting Environment Variables

**Local Development** (`.env` file):
```env
PORT=8080
SYNC_TOKEN=my_secret_token
```

**Docker**:
```bash
docker run -e SYNC_TOKEN=my_secret_token -p 8080:8080 stampcoin-platform
```

**GitHub Actions**:
- Set in repository **Settings** > **Secrets and variables** > **Actions**
- Add `SYNC_TOKEN` as a secret

**Cloud Platforms**:
- Configure in platform's dashboard under environment variables

---

## Health Checks

### Endpoint Health Check

```bash
# Check if server is running
curl http://localhost:8080/api/market/items

# Expected response: [] (empty array) or list of items
```

### Docker Health Check

Add to `Dockerfile`:
```dockerfile
HEALTHCHECK --interval=30s --timeout=3s \
  CMD node -e "require('http').get('http://localhost:8080/api/market/items', (r) => {process.exit(r.statusCode === 200 ? 0 : 1)})"
```

---

## Monitoring and Logs

### Docker Logs

```bash
# View logs
docker logs stampcoin

# Follow logs
docker logs -f stampcoin

# Last 100 lines
docker logs --tail 100 stampcoin
```

### Application Logs

The application logs to stdout/stderr:
- Server start message
- API endpoint availability
- Request errors
- Data file operations

---

## Scaling and Performance

### Horizontal Scaling

For production, consider:
1. Load balancer (nginx, HAProxy)
2. Multiple container instances
3. Shared data storage (Redis, PostgreSQL)
4. Session management

### Database Migration

For production, replace file-based storage with:
- **PostgreSQL**: User wallets and transactions
- **MongoDB**: Market items and metadata
- **Redis**: Caching and sessions

---

## Security Considerations

### Production Checklist

- [ ] Set strong `SYNC_TOKEN`
- [ ] Enable HTTPS (SSL/TLS)
- [ ] Configure CORS properly
- [ ] Use secrets manager for tokens
- [ ] Enable rate limiting
- [ ] Set up monitoring and alerts
- [ ] Regular security updates
- [ ] Backup data regularly

### HTTPS Setup

For production, use:
- Let's Encrypt certificates
- Cloud platform SSL termination
- Reverse proxy with SSL (nginx)

---

## Troubleshooting

### Common Issues

**Port already in use**:
```bash
# Find and kill process
lsof -ti:8080 | xargs kill
```

**Docker build fails**:
```bash
# Clean Docker cache
docker system prune -a
docker build --no-cache -t stampcoin-platform .
```

**Module not found**:
```bash
# Reinstall dependencies
rm -rf node_modules package-lock.json
npm install
```

---

## Quick Reference

### NPM Scripts

```bash
npm start          # Start production server
npm run dev        # Start development server
npm run build      # Build for production
npm test           # Run tests
npm run lint       # Lint code
npm run docker:build   # Build Docker image
npm run docker:run     # Run Docker container
```

### API Endpoints

- `GET /api/market/items` - List market items
- `POST /api/market/items` - Add market item
- `GET /api/wallets` - List wallets
- `POST /api/wallets` - Create wallet
- See [MARKET_API.md](MARKET_API.md) and [WALLET_API.md](WALLET_API.md) for full API documentation

---

## Support / الدعم

For issues and questions:
- Create issue on GitHub
- Check documentation: [README.md](README.md)
- Review API docs: [MARKET_API.md](MARKET_API.md), [WALLET_API.md](WALLET_API.md)

---

**Last Updated**: February 2026
