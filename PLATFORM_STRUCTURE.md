# Platform Structure / بنية المنصة / Plattformstruktur

## Overview / نظرة عامة / Übersicht

This document describes the basic structure of the Stampcoin Platform.

## Directory Structure / هيكل الدليل / Verzeichnisstruktur

```
stp/
├── .github/
│   └── workflows/          # CI/CD workflows
│       ├── docker.yml      # Docker build and push
│       └── pages.yml       # GitHub Pages deployment
├── docs/                   # Static website files
│   ├── index.html         # Main landing page
│   ├── roadmap.md         # Platform roadmap
│   └── business-onepager_Version6.md
├── lib/                    # Library files
├── scripts/                # Utility scripts
├── server/                 # Server components
├── data.json              # Application data storage
├── server.js              # Main server application
├── package.json           # Node.js dependencies
├── Dockerfile             # Docker configuration
├── README.md              # Main documentation
├── DEPLOYMENT.md          # Deployment guide
├── INSTALLATION.md        # Installation guide
├── SECURITY.md            # Security guidelines
└── CONTRIBUTING.md        # Contribution guidelines
```

## Core Components / المكونات الأساسية / Kernkomponenten

### 1. Server Application / تطبيق الخادم / Serveranwendung
- **File**: `server.js`
- **Purpose**: Express.js REST API server
- **Port**: 8080 (configurable via PORT env var)
- **Endpoints**:
  - `GET /sync` - Retrieve data
  - `POST /sync` - Update data

### 2. Data Storage / تخزين البيانات / Datenspeicherung
- **File**: `data.json`
- **Format**: JSON array
- **Purpose**: Persistent data storage

### 3. Docker Container / حاوية Docker / Docker-Container
- **File**: `Dockerfile`
- **Base Image**: node:18-alpine
- **Exposed Port**: 8080
- **Features**:
  - Non-root user for security
  - Production dependencies only
  - Optimized for size

### 4. GitHub Workflows / سير عمل GitHub / GitHub-Workflows

#### Docker Workflow (`docker.yml`)
- **Trigger**: Push to `main` branch
- **Actions**:
  - Build Docker image
  - Push to GitHub Container Registry (ghcr.io)
- **Output**: `ghcr.io/zedanazad43/stampcoin-platform:latest`

#### Pages Workflow (`pages.yml`)
- **Trigger**: Push to `main` branch
- **Actions**:
  - Build static site from `docs/` folder
  - Deploy to GitHub Pages
- **Output**: https://zedanazad43.github.io/stp/

### 5. Documentation / التوثيق / Dokumentation

#### Main Documentation Files:
- `README.md` - Overview and quick start
- `DEPLOYMENT.md` - Comprehensive deployment guide
- `INSTALLATION.md` - Installation instructions
- `SECURITY.md` - Security best practices
- `CONTRIBUTING.md` - Contribution guidelines

#### Supporting Documents:
- `GITHUB_PAGES_SETUP.md` - GitHub Pages configuration
- `WINDOWS_SETUP.md` - Windows-specific setup
- `PRESERVATION_NOTES.md` - Repository preservation info
- `FILE_INVENTORY.md` - Complete file listing

## Technology Stack / مجموعة التقنيات / Technologie-Stack

### Backend / الخلفية / Backend
- **Runtime**: Node.js >= 16.x
- **Framework**: Express.js 4.18.2
- **Middleware**: CORS 2.8.5
- **Containerization**: Docker

### Frontend / الواجهة الأمامية / Frontend
- **Type**: Static HTML/CSS/JavaScript
- **Hosting**: GitHub Pages
- **Source**: `docs/` directory

### DevOps / العمليات التطويرية / DevOps
- **CI/CD**: GitHub Actions
- **Container Registry**: GitHub Container Registry (ghcr.io)
- **Deployment**: Automated via workflows

## Environment Variables / متغيرات البيئة / Umgebungsvariablen

| Variable | Purpose | Default | Required |
|----------|---------|---------|----------|
| `PORT` | Server port / منفذ الخادم / Server-Port | 8080 | No |
| `SYNC_TOKEN` | API authentication token / رمز مصادقة API / API-Auth-Token | - | No (dev mode) |

## API Endpoints / نقاط نهاية API / API-Endpunkte

### GET /sync
**Purpose**: Retrieve all data  
**Authentication**: Bearer token (if SYNC_TOKEN is set)  
**Response**:
```json
{
  "todos": []
}
```

### POST /sync
**Purpose**: Update data  
**Authentication**: Bearer token (if SYNC_TOKEN is set)  
**Request Body**:
```json
{
  "todos": [...]
}
```
**Response**:
```json
{
  "ok": true
}
```

## Security Considerations / اعتبارات الأمان / Sicherheitsüberlegungen

1. **Authentication**: Set `SYNC_TOKEN` in production
2. **Non-root User**: Docker runs as non-root for security
3. **CORS**: Enabled for cross-origin requests
4. **No Secrets**: Never commit secrets to repository
5. **Environment Variables**: Use .env files (not committed)

## Development Workflow / سير عمل التطوير / Entwicklungs-Workflow

1. **Local Development**:
   ```bash
   npm install
   npm run dev
   ```

2. **Test Docker Build**:
   ```bash
   docker build -t stampcoin-test .
   docker run -p 8080:8080 stampcoin-test
   ```

3. **Push to Main**:
   - Automatically triggers Docker build
   - Automatically deploys to GitHub Pages

## Deployment Options / خيارات النشر / Bereitstellungsoptionen

1. **GitHub Pages** - For static frontend
2. **Docker Container** - For server application
3. **Cloud Platforms** - Compatible with:
   - AWS (ECS, Fargate)
   - Google Cloud (Cloud Run)
   - Azure (Container Instances)
   - Heroku
   - Railway
   - Fly.io

## Monitoring / المراقبة / Überwachung

### Logs / السجلات / Protokolle
- Server logs: `console.log()` statements
- Docker logs: `docker logs <container_id>`
- GitHub Actions: Check workflow runs

### Health Checks / فحوصات الصحة / Gesundheitschecks
- Test endpoint: `curl http://localhost:8080/sync`
- Expected response: `{"todos":[]}`

## Future Enhancements / التحسينات المستقبلية / Zukünftige Verbesserungen

See `docs/roadmap.md` for planned features and improvements.

## Support / الدعم / Unterstützung

- **Issues**: Report on GitHub Issues
- **Documentation**: Check `DEPLOYMENT.md` and `INSTALLATION.md`
- **Contributing**: See `CONTRIBUTING.md`

---

## Quick Commands / أوامر سريعة / Schnellbefehle

### Start Server / تشغيل الخادم / Server starten
```bash
node server.js
```

### Build Docker / بناء Docker / Docker erstellen
```bash
docker build -t stampcoin .
```

### Run Docker / تشغيل Docker / Docker ausführen
```bash
docker run -d -p 8080:8080 stampcoin
```

### Test API / اختبار API / API testen
```bash
curl http://localhost:8080/sync
```

---

Last Updated: 2026-02-07
