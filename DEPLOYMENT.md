# دليل النشر / Deployment Guide / Bereitstellungsanleitung

## العربية 🇸🇦

### نظرة عامة
توفر منصة Stampcoin خيارات متعددة للنشر:
- GitHub Pages للواجهة الأمامية الثابتة
- Docker Container للنشر على أي منصة
- خوادم Node.js مباشرة

### 1. النشر على GitHub Pages

#### تفعيل GitHub Pages
1. اذهب إلى إعدادات المستودع (Settings)
2. اختر "Pages" من القائمة الجانبية
3. في "Source"، اختر "GitHub Actions"
4. احفظ التغييرات

سيتم نشر الموقع تلقائياً على: `https://zedanazad43.github.io/stp/`

#### سير العمل (Workflow)
ملف `.github/workflows/pages.yml` يقوم بـ:
- بناء الموقع الثابت من مجلد `docs`
- نشره على GitHub Pages تلقائياً عند الدفع إلى branch `main`

### 2. النشر باستخدام Docker

#### بناء الصورة
```bash
docker build -t stampcoin-platform .
```

#### تشغيل الحاوية
```bash
docker run -d -p 8080:8080 \
  -e SYNC_TOKEN=your-secret-token \
  --name stampcoin \
  stampcoin-platform
```

#### النشر على GitHub Container Registry
سير العمل `.github/workflows/docker.yml` يقوم بـ:
- بناء صورة Docker تلقائياً
- نشرها على `ghcr.io` عند الدفع إلى branch `main`

استخدام الصورة المنشورة:
```bash
docker pull ghcr.io/zedanazad43/stampcoin-platform:latest
docker run -d -p 8080:8080 ghcr.io/zedanazad43/stampcoin-platform:latest
```

### 3. النشر المباشر على خادم Node.js

```bash
# تثبيت المتطلبات
npm install --production

# إعداد متغيرات البيئة
export PORT=8080
export SYNC_TOKEN=your-secret-token

# تشغيل الخادم
node server.js
```

#### استخدام PM2 لإدارة العملية
```bash
# تثبيت PM2
npm install -g pm2

# تشغيل التطبيق
pm2 start server.js --name stampcoin

# حفظ التكوين
pm2 save
pm2 startup
```

### متغيرات البيئة
- `PORT`: منفذ الخادم (افتراضي: 8080)
- `SYNC_TOKEN`: رمز المصادقة للـ API (اختياري في التطوير)

---

## English 🇬🇧

### Overview
Stampcoin Platform provides multiple deployment options:
- GitHub Pages for static frontend
- Docker Container for deployment to any platform
- Direct Node.js server deployment

### 1. GitHub Pages Deployment

#### Enable GitHub Pages
1. Go to repository Settings
2. Select "Pages" from sidebar
3. Under "Source", choose "GitHub Actions"
4. Save changes

Site will be published at: `https://zedanazad43.github.io/stp/`

#### Workflow
The `.github/workflows/pages.yml` file:
- Builds static site from `docs` folder
- Automatically deploys to GitHub Pages on push to `main` branch

### 2. Docker Deployment

#### Build Image
```bash
docker build -t stampcoin-platform .
```

#### Run Container
```bash
docker run -d -p 8080:8080 \
  -e SYNC_TOKEN=your-secret-token \
  --name stampcoin \
  stampcoin-platform
```

#### Deploy to GitHub Container Registry
The `.github/workflows/docker.yml` workflow:
- Automatically builds Docker image
- Publishes to `ghcr.io` on push to `main` branch

Using published image:
```bash
docker pull ghcr.io/zedanazad43/stampcoin-platform:latest
docker run -d -p 8080:8080 ghcr.io/zedanazad43/stampcoin-platform:latest
```

### 3. Direct Node.js Deployment

```bash
# Install dependencies
npm install --production

# Set environment variables
export PORT=8080
export SYNC_TOKEN=your-secret-token

# Start server
node server.js
```

#### Using PM2 for Process Management
```bash
# Install PM2
npm install -g pm2

# Start application
pm2 start server.js --name stampcoin

# Save configuration
pm2 save
pm2 startup
```

### Environment Variables
- `PORT`: Server port (default: 8080)
- `SYNC_TOKEN`: API authentication token (optional in development)

---

## Deutsch 🇩🇪

### Übersicht
Stampcoin Platform bietet mehrere Bereitstellungsoptionen:
- GitHub Pages für statisches Frontend
- Docker Container für Bereitstellung auf jeder Plattform
- Direkte Node.js-Server-Bereitstellung

### 1. GitHub Pages Bereitstellung

#### GitHub Pages aktivieren
1. Gehe zu Repository-Einstellungen (Settings)
2. Wähle "Pages" in der Seitenleiste
3. Unter "Source", wähle "GitHub Actions"
4. Änderungen speichern

Website wird veröffentlicht unter: `https://zedanazad43.github.io/stp/`

#### Workflow
Die Datei `.github/workflows/pages.yml`:
- Erstellt statische Website aus `docs` Ordner
- Veröffentlicht automatisch auf GitHub Pages bei Push zu `main` Branch

### 2. Docker Bereitstellung

#### Image erstellen
```bash
docker build -t stampcoin-platform .
```

#### Container ausführen
```bash
docker run -d -p 8080:8080 \
  -e SYNC_TOKEN=your-secret-token \
  --name stampcoin \
  stampcoin-platform
```

#### Auf GitHub Container Registry bereitstellen
Der `.github/workflows/docker.yml` Workflow:
- Erstellt automatisch Docker Image
- Veröffentlicht auf `ghcr.io` bei Push zu `main` Branch

Veröffentlichtes Image verwenden:
```bash
docker pull ghcr.io/zedanazad43/stampcoin-platform:latest
docker run -d -p 8080:8080 ghcr.io/zedanazad43/stampcoin-platform:latest
```

### 3. Direkte Node.js Bereitstellung

```bash
# Abhängigkeiten installieren
npm install --production

# Umgebungsvariablen setzen
export PORT=8080
export SYNC_TOKEN=your-secret-token

# Server starten
node server.js
```

#### PM2 für Prozessverwaltung verwenden
```bash
# PM2 installieren
npm install -g pm2

# Anwendung starten
pm2 start server.js --name stampcoin

# Konfiguration speichern
pm2 save
pm2 startup
```

### Umgebungsvariablen
- `PORT`: Server-Port (Standard: 8080)
- `SYNC_TOKEN`: API-Authentifizierungstoken (optional in Entwicklung)

---

## Deployment Checklist / قائمة التحقق / Checkliste

### Pre-Deployment / قبل النشر / Vor der Bereitstellung
- [x] Install dependencies / تثبيت المتطلبات / Abhängigkeiten installieren
- [x] Test server locally / اختبار الخادم محلياً / Server lokal testen
- [x] Build Docker image / بناء صورة Docker / Docker Image erstellen
- [x] Test Docker container / اختبار حاوية Docker / Docker Container testen
- [x] Configure environment variables / تكوين متغيرات البيئة / Umgebungsvariablen konfigurieren

### Deployment / النشر / Bereitstellung
- [x] Enable GitHub Pages (Settings > Pages > GitHub Actions)
- [x] Push to main branch for automatic deployment
- [x] Docker image will be built and published automatically
- [x] Site accessible at: https://zedanazad43.github.io/stp/

### Post-Deployment / بعد النشر / Nach der Bereitstellung
- [ ] Verify GitHub Pages is accessible
- [ ] Test API endpoints
- [ ] Monitor logs for errors
- [ ] Set up monitoring (optional)

---

## Troubleshooting / استكشاف الأخطاء / Fehlerbehebung

### GitHub Pages Not Working
**Issue**: Site not deploying  
**Solution**: 
1. Check Settings > Pages is enabled with "GitHub Actions"
2. Verify workflow runs in Actions tab
3. Check workflow logs for errors

### Docker Container Fails
**Issue**: Container exits immediately  
**Solution**:
1. Check logs: `docker logs stampcoin`
2. Verify port is not in use: `lsof -i :8080`
3. Check environment variables are set correctly

### API Returns 401 Unauthorized
**Issue**: Authentication failures  
**Solution**:
1. Set SYNC_TOKEN environment variable
2. Include token in Authorization header: `Bearer YOUR_TOKEN`
3. For development, leave SYNC_TOKEN unset to disable authentication

---

## Additional Resources / موارد إضافية / Zusätzliche Ressourcen

- [Installation Guide / دليل التثبيت / Installationsanleitung](INSTALLATION.md)
- [GitHub Pages Setup / إعداد GitHub Pages / GitHub Pages Einrichtung](GITHUB_PAGES_SETUP.md)
- [Security Guidelines / إرشادات الأمان / Sicherheitsrichtlinien](SECURITY.md)
- [Contributing / المساهمة / Beiträge](CONTRIBUTING.md)
