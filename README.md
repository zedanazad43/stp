# Stampcoin منصة رقمية | Digital Platform | Digitale Plattform | 数字平台 | Plateforme Numérique | Plataforma Digital

🌐 **[Visit the Official Website](https://zedanazad43.github.io/stp/)** | **[View Documentation](docs/)** | **[Roadmap](docs/roadmap.html)**

> **🌐 Live Demo**: [https://zedanazad43.github.io/stp/](https://zedanazad43.github.io/stp/)

> **📦 Repository Preservation Notice**  
> This repository contains a complete backup of all files from [stampcoin-platform/stampcoin-platform](https://github.com/stampcoin-platform/stampcoin-platform).  
> **Import Date**: February 5, 2026 | **Total Files**: 55 | **Status**: ✅ Verified  
> For detailed preservation information, see [PRESERVATION_NOTES.md](PRESERVATION_NOTES.md) and [FILE_INVENTORY.md](FILE_INVENTORY.md)

---

## 🌐 Website

**Live Website**: https://zedanazad43.github.io/stp/

Visit our website to explore the Stampcoin platform features and roadmap.

---

## العربية 🇸🇦

### الوصف
Stampcoin منصة رقمية مبتكرة مبنية على تكنولوجيا البلوكشين، متخصصة في جمع وتداول الطوابع الرقمية والمكافآت وهدايا الولاء.

### المميزات
- محفظة طوابع رقمية (Digital Wallet API)
  - إنشاء وإدارة المحافظ الرقمية
  - إدارة الأرصدة والطوابع الرقمية
  - تحويلات آمنة بين المستخدمين (P2P)
  - سجل المعاملات الكامل
- **مؤسسة السوق (Market Institution API) - جديد!**
  - إضافة وإدارة عناصر السوق
  - شراء وبيع الطوابع الرقمية
  - سجل المعاملات التجارية
  - تكامل كامل مع المحافظ الرقمية
- تعاملات آمنة بين المستخدمين
- سوق طوابع رقمية ومقتنيات حديثة
- إدارة ملفات المستخدم والتحقق
- تكامل API وخدمات إضافية

### البدء السريع
راجع [دليل البدء السريع](QUICKSTART.md) للبدء بسرعة!

### الإنطلاق
```
git clone https://github.com/zedanazad43/stp.git
cd stp
```
لمزيد من المعلومات: [INSTALLATION.md](INSTALLATION.md)

🌐 **[زيارة الموقع الرسمي](https://zedanazad43.github.io/stp/)**

---

## English 🇬🇧

### Description
Stampcoin is an innovative platform for digital currency based on blockchain tech, focused on digital stamps, rewards, and loyalty tokens.

### Features
- Digital stamps wallet with full API
  - Create and manage digital wallets
  - Balance and digital stamps management
  - Secure peer-to-peer transfers
  - Complete transaction history
- **Market Institution API - New!**
  - Add and manage market items
  - Buy and sell digital stamps
  - Commercial transaction history
  - Full integration with digital wallets
- Secure peer-to-peer transfers
- Marketplace for digital stamps & collectibles
- User profile & verification
- API integration

### Quick Start
See the [Quick Start Guide](QUICKSTART.md) to get started quickly!

### Start
```
git clone https://github.com/zedanazad43/stp.git
cd stp
```
See [INSTALLATION.md](INSTALLATION.md) for more.

🌐 **[Visit Website](https://zedanazad43.github.io/stp/)**

---

## Deutsch 🇩🇪

### Beschreibung
Stampcoin ist eine innovative Plattform auf Blockchain-Basis für digitale Briefmarken, Prämien und loyale Sammler.

### Haupt-Features
- Digitale Wallet für Stampcoins
- Sichere Nutzer-Transaktionen
- Märkte für Sammlerstücke und Stampcoins
- Nutzerprofile & Verifikationen
- API-Integration

### Start
```
git clone https://github.com/zedanazad43/stp.git
cd stp
```
Weitere Infos: [INSTALLATION.md](INSTALLATION.md)

🌐 **[Website besuchen](https://zedanazad43.github.io/stp/)**

---

## 📦 Installation

See [INSTALLATION.md](INSTALLATION.md) for detailed installation instructions.

### Quick Start

```bash
# Clone repository
git clone https://github.com/zedanazad43/stp.git
cd stp

# Install dependencies
npm install

# Development
npm run dev         # Start development server
npm run build       # Build for production
npm run serve       # Serve built files locally
npm run clean       # Clean build artifacts

# Testing
npm test
npm run lint
```

### Wallet API | واجهة برمجة المحفظة

For detailed information about the Digital Wallet API endpoints and usage, see [WALLET_API.md](WALLET_API.md).

للحصول على معلومات مفصلة حول نقاط نهاية واجهة برمجة تطبيقات المحفظة الرقمية واستخدامها، راجع [WALLET_API.md](WALLET_API.md).

### Market Institution API | واجهة برمجة مؤسسة السوق

For detailed information about the Market Institution API endpoints and usage, see [MARKET_API.md](MARKET_API.md).

للحصول على معلومات مفصلة حول نقاط نهاية واجهة برمجة تطبيقات مؤسسة السوق واستخدامها، راجع [MARKET_API.md](MARKET_API.md).

---

### 中文 🇨🇳
#### 先决条件
- Node.js >= 16.x
- Python >= 3.8 (推荐 3.14.3)
- Git
- Docker Desktop (اختياري - للتشغيل باستخدام حاويات Docker)

#### التشغيل باستخدام Docker (موصى به)
```bash
# تأكد من تشغيل Docker Desktop أولاً
docker pull ghcr.io/zedanazad43/stampcoin-platform:latest
docker run -p 8080:8080 ghcr.io/zedanazad43/stampcoin-platform:latest
# افتح المتصفح على: http://localhost:8080
```

**Windows 用户**：请参阅 [WINDOWS_SETUP.md](WINDOWS_SETUP.md) 了解使用 Chocolatey 的详细设置说明。

#### 开发
```bash
npm install
npm run dev
```

#### 生产构建
```bash
npm run build
npm run start
```

#### 测试
```bash
npm test
npm run lint
```

---

### Français 🇫🇷
#### Prérequis
- Node.js >= 16.x
- Python >= 3.8 (3.14.3 recommandé)
- Git
- Docker Desktop (optional - for containerized deployment)

#### Docker Quick Start (Recommended)
```bash
# Ensure Docker Desktop is running first
docker pull ghcr.io/zedanazad43/stampcoin-platform:latest
docker run -p 8080:8080 ghcr.io/zedanazad43/stampcoin-platform:latest
# Open browser to: http://localhost:8080
```

**Utilisateurs Windows** : Voir [WINDOWS_SETUP.md](WINDOWS_SETUP.md) pour des instructions détaillées d'installation avec Chocolatey.

#### Développement
```bash
npm install
npm run dev
```

#### Build de Production
```bash
npm run build
npm run start
```

#### Tests
```bash
npm test
npm run lint
```

---

### Español 🇪🇸
#### Requisitos Previos
- Node.js >= 16.x
- Python >= 3.8 (3.14.3 recomendado)
- Git
- Docker Desktop (optional - für containerisierte Bereitstellung)

#### Docker-Schnellstart (Empfohlen)
```bash
# Stelle sicher, dass Docker Desktop läuft
docker pull ghcr.io/zedanazad43/stampcoin-platform:latest
docker run -p 8080:8080 ghcr.io/zedanazad43/stampcoin-platform:latest
# Öffne Browser: http://localhost:8080
```

**Usuarios de Windows**: Ver [WINDOWS_SETUP.md](WINDOWS_SETUP.md) para instrucciones detalladas de configuración usando Chocolatey.

#### Desarrollo
```bash
npm install
npm run dev
```

#### Build de Producción
```bash
npm run build
npm run start
```

#### Pruebas
```bash
npm test
npm run lint
```

---

## النشر / Deployment / Bereitstellung

### العربية 🇸🇦
- **الموقع المباشر**: [https://zedanazad43.github.io/stp/](https://zedanazad43.github.io/stp/)
- **دليل النشر الكامل**: [DEPLOYMENT.md](DEPLOYMENT.md)

### English 🇬🇧
- **Live Site**: [https://zedanazad43.github.io/stp/](https://zedanazad43.github.io/stp/)
- **Full Deployment Guide**: [DEPLOYMENT.md](DEPLOYMENT.md)

### Deutsch 🇩🇪
- **Live-Website**: [https://zedanazad43.github.io/stp/](https://zedanazad43.github.io/stp/)
- **Vollständige Bereitstellungsanleitung**: [DEPLOYMENT.md](DEPLOYMENT.md)

---

## الأمان / Security / Sicherheit

⚠️ **تحذير أمني مهم** / **SECURITY WARNING** / **SICHERHEITSWARNUNG**

The Stampcoin platform includes an official website hosted on GitHub Pages:

**🔗 Live Website**: [https://zedanazad43.github.io/stp/](https://zedanazad43.github.io/stp/)

### Building the Website Locally

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

### License

See LICENSE for license information.
