# Stampcoin منصة رقمية | Digital Platform | Digitale Plattform | 数字平台 | Plateforme Numérique | Plataforma Digital

> **📦 Repository Preservation Notice**  
> This repository contains a complete backup of all files from [stampcoin-platform/stampcoin-platform](https://github.com/stampcoin-platform/stampcoin-platform).  
> **Import Date**: February 5, 2026 | **Total Files**: 55 | **Status**: ✅ Verified  
> For detailed preservation information, see [PRESERVATION_NOTES.md](PRESERVATION_NOTES.md) and [FILE_INVENTORY.md](FILE_INVENTORY.md)

---

## 🌍 Multilingual Support | دعم متعدد اللغات | Mehrsprachige Unterstützung | 多语言支持 | Support Multilingue | Soporte Multilingüe

This platform supports **6 languages**: العربية • English • Deutsch • 中文 • Français • Español

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
git clone https://github.com/stampcoin-platform/stampcoin-platform.git
cd stampcoin-platform
```
لمزيد من المعلومات: [INSTALLATION.md](INSTALLATION.md)

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
git clone https://github.com/stampcoin-platform/stampcoin-platform.git
cd stampcoin-platform
```
See [INSTALLATION.md](INSTALLATION.md) for more.

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
git clone https://github.com/stampcoin-platform/stampcoin-platform.git
cd stampcoin-platform
```
Weitere Infos: [INSTALLATION.md](INSTALLATION.md)

---

## 中文 🇨🇳

### 描述
Stampcoin 是一个基于区块链技术的创新平台，专注于数字邮票、奖励和忠诚度代币。

### 功能特点
- 数字邮票钱包
- 安全的点对点转账
- 数字邮票和收藏品市场
- 用户资料和验证
- API 集成

### 开始使用
```
git clone https://github.com/stampcoin-platform/stampcoin-platform.git
cd stampcoin-platform
```
更多信息请参见 [INSTALLATION.md](INSTALLATION.md)

---

## Français 🇫🇷

### Description
Stampcoin est une plateforme innovante de monnaie numérique basée sur la technologie blockchain, axée sur les timbres numériques, les récompenses et les jetons de fidélité.

### Fonctionnalités
- Portefeuille de timbres numériques
- Transferts peer-to-peer sécurisés
- Place de marché pour timbres et objets de collection numériques
- Profil utilisateur et vérification
- Intégration API

### Démarrer
```
git clone https://github.com/stampcoin-platform/stampcoin-platform.git
cd stampcoin-platform
```
Voir [INSTALLATION.md](INSTALLATION.md) pour plus d'informations.

---

## Español 🇪🇸

### Descripción
Stampcoin es una plataforma innovadora de moneda digital basada en tecnología blockchain, enfocada en sellos digitales, recompensas y tokens de lealtad.

### Características
- Cartera de sellos digitales
- Transferencias peer-to-peer seguras
- Mercado de sellos digitales y coleccionables
- Perfil de usuario y verificación
- Integración API

### Comenzar
```
git clone https://github.com/stampcoin-platform/stampcoin-platform.git
cd stampcoin-platform
```
Ver [INSTALLATION.md](INSTALLATION.md) para más información.

---

## النشر والتشغيل / Deployment & Running / Bereitstellung & Ausführung / 部署和运行 / Déploiement et Exécution / Implementación y Ejecución

### العربية 🇸🇦
#### المتطلبات الأساسية
- Node.js >= 16.x
- Python >= 3.9
- Git
- Docker Desktop (اختياري - للتشغيل باستخدام حاويات Docker)

#### التشغيل باستخدام Docker (موصى به)
```bash
# تأكد من تشغيل Docker Desktop أولاً
docker pull ghcr.io/zedanazad43/stampcoin-platform:latest
docker run -p 8080:8080 ghcr.io/zedanazad43/stampcoin-platform:latest
# افتح المتصفح على: http://localhost:8080
```

**ملاحظة لمستخدمي Windows**: راجع [WINDOWS_SETUP.md](WINDOWS_SETUP.md) للحصول على تعليمات مفصلة باستخدام Chocolatey.

#### بدء التطوير
```bash
npm install
npm run dev
```

#### البناء للإنتاج
```bash
npm run build
npm run start
```

#### الاختبارات
```bash
npm test
npm run lint
```

### English 🇬🇧
#### Prerequisites
- Node.js >= 16.x
- Python >= 3.9
- Git
- Docker Desktop (optional - for running with Docker containers)

#### Running with Docker (Recommended)
```bash
# Ensure Docker Desktop is running first
docker pull ghcr.io/zedanazad43/stampcoin-platform:latest
docker run -p 8080:8080 ghcr.io/zedanazad43/stampcoin-platform:latest
# Open browser to: http://localhost:8080
```

**Windows Users**: See [WINDOWS_SETUP.md](WINDOWS_SETUP.md) for detailed setup instructions using Chocolatey.

#### Development
```bash
npm install
npm run dev
```

#### Production Build
```bash
npm run build
npm run start
```

#### Testing
```bash
npm test
npm run lint
```

### Deutsch 🇩🇪
#### Voraussetzungen
- Node.js >= 16.x
- Python >= 3.9
- Git
- Docker Desktop (optional - für Ausführung mit Docker-Containern)

#### Mit Docker ausführen (Empfohlen)
```bash
# Stelle sicher, dass Docker Desktop läuft
docker pull ghcr.io/zedanazad43/stampcoin-platform:latest
docker run -p 8080:8080 ghcr.io/zedanazad43/stampcoin-platform:latest
# Öffne Browser auf: http://localhost:8080
```

**Windows-Benutzer**: Siehe [WINDOWS_SETUP.md](WINDOWS_SETUP.md) für detaillierte Anweisungen mit Chocolatey.

#### Entwicklung
```bash
npm install
npm run dev
```

#### Produktion
```bash
npm run build
npm run start
```

#### Tests
```bash
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

## الأمان / Security / Sicherheit / 安全 / Sécurité / Seguridad

⚠️ **تحذير أمني مهم** / **SECURITY WARNING** / **SICHERHEITSWARNUNG** / **安全警告** / **AVERTISSEMENT DE SÉCURITÉ** / **ADVERTENCIA DE SEGURIDAD**

- لا تشارك مفاتيح API أو كلمات المرور في المستودع
- استخدم متغيرات البيئة (.env) للبيانات الحساسة
- راجع [SECURITY.md](SECURITY.md) للمزيد من التفاصيل

---

## المساهمة / Contributing / Beitragen

### العربية 🇸🇦
نرحب بالمساهمات! يرجى مراجعة:
- [CONTRIBUTING.md](CONTRIBUTING.md) - دليل المساهمة
- [REPOSITORY_SETTINGS.md](REPOSITORY_SETTINGS.md) - إعدادات المستودع

### English 🇬🇧
Contributions are welcome! Please review:
- [CONTRIBUTING.md](CONTRIBUTING.md) - Contribution guidelines
- [REPOSITORY_SETTINGS.md](REPOSITORY_SETTINGS.md) - Repository settings guide

### Deutsch 🇩🇪
Beiträge sind willkommen! Bitte prüfen Sie:
- [CONTRIBUTING.md](CONTRIBUTING.md) - Beitragsrichtlinien
- [REPOSITORY_SETTINGS.md](REPOSITORY_SETTINGS.md) - Repository-Einstellungen

### 📋 Quick Start for Contributors

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Make your changes** and commit: `git commit -m 'feat: Add amazing feature'`
4. **Push to your branch**: `git push origin feature/amazing-feature`
5. **Open a Pull Request**

> **Note**: Direct pushes to `main` are protected. All changes must go through pull requests.

---

## 📚 Documentation / التوثيق / Dokumentation

- [INSTALLATION.md](INSTALLATION.md) - Installation guide / دليل التثبيت
- [CONTRIBUTING.md](CONTRIBUTING.md) - How to contribute / كيفية المساهمة
- [REPOSITORY_SETTINGS.md](REPOSITORY_SETTINGS.md) - Repository settings / إعدادات المستودع
- [SECURITY.md](SECURITY.md) - Security policy / سياسة الأمان
- [WORKFLOW_FIXES_SUMMARY.md](WORKFLOW_FIXES_SUMMARY.md) - CI/CD workflow information

---

### License

See LICENSE for license information.
# Stampcoin منصة / Platform / Plattform

---

## العربية 🇸🇦

### الوصف
Stampcoin منصة رقمية مبتكرة مبنية على تكنولوجيا البلوكشين، متخصصة في جمع وتداول الطوابع الرقمية والمكافآت وهدايا الولاء.

### المميزات
- محفظة طوابع رقمية
- تعاملات آمنة بين المستخدمين
- سوق طوابع رقمية ومقتنيات حديثة
- إدارة ملفات المستخدم والتحقق
- تكامل API وخدمات إضافية

### الإنطلاق
```
git clone https://github.com/stampcoin-platform/stampcoin-platform.git
cd stampcoin-platform
```
لمزيد من المعلومات: [INSTALLATION.md](INSTALLATION.md)

---

## English 🇬🇧

### Description
Stampcoin is an innovative platform for digital currency based on blockchain tech, focused on digital stamps, rewards, and loyalty tokens.

### Features
- Digital stamps wallet
- Secure peer-to-peer transfers
- Marketplace for digital stamps & collectibles
- User profile & verification
- API integration

### Start
```
git clone https://github.com/stampcoin-platform/stampcoin-platform.git
cd stampcoin-platform
```
See [INSTALLATION.md](INSTALLATION.md) for more.

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
git clone https://github.com/stampcoin-platform/stampcoin-platform.git
cd stampcoin-platform
```
Weitere Infos: [INSTALLATION.md](INSTALLATION.md)
