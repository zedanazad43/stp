# Stampcoin منصة رقمية | Digital Platform | Digitale Plattform

> **📦 Repository Preservation Notice**  
> This repository contains a complete backup of all files from [stampcoin-platform/stampcoin-platform](https://github.com/stampcoin-platform/stampcoin-platform).  
> **Import Date**: February 5, 2026 | **Total Files**: 55 | **Status**: ✅ Verified  
> For detailed preservation information, see [PRESERVATION_NOTES.md](PRESERVATION_NOTES.md) and [FILE_INVENTORY.md](FILE_INVENTORY.md)

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

## النشر والتشغيل / Deployment & Running / Bereitstellung & Ausführung

### العربية 🇸🇦
#### المتطلبات الأساسية
- Node.js >= 16.x
- Python >= 3.8 (يُوصى بـ 3.14.3)
- Git

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
- Python >= 3.8 (3.14.3 recommended)
- Git

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
- Python >= 3.8 (3.14.3 empfohlen)
- Git

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

## الأمان / Security / Sicherheit

⚠️ **تحذير أمني مهم** / **SECURITY WARNING** / **SICHERHEITSWARNUNG**

- لا تشارك مفاتيح API أو كلمات المرور في المستودع
- استخدم متغيرات البيئة (.env) للبيانات الحساسة
- راجع [SECURITY.md](SECURITY.md) للمزيد من التفاصيل

---

## 🚀 التكامل المستمر/التسليم المستمر | CI/CD | CI/CD

### العربية 🇸🇦

#### خوادم التشغيل المستضافة ذاتيًا (Self-Hosted Runners)

يدعم هذا المستودع تشغيل سير العمل CI/CD على خوادمك الخاصة باستخدام GitHub Actions Self-Hosted Runners.

**المزايا:**
- 🏢 التحكم الكامل في بيئة التشغيل
- 💰 توفير التكاليف للمشاريع الكبيرة
- 🔒 الأمان المحسّن لمتطلبات الامتثال
- ⚡ أداء أفضل مع الأجهزة المخصصة

**البدء السريع:**
```bash
# دليل سريع متاح في
📄 QUICKSTART_SELF_HOSTED_RUNNER.md

# دليل مفصل متاح في
📚 SELF_HOSTED_RUNNER_SETUP.md
```

**سير العمل المتاح:**
- ✅ `self-hosted-ci.yml` - بناء واختبار تلقائي على خوادمك

### English 🇬🇧

#### Self-Hosted Runners

This repository supports running CI/CD workflows on your own infrastructure using GitHub Actions Self-Hosted Runners.

**Benefits:**
- 🏢 Full control over execution environment
- 💰 Cost savings for high-volume projects
- 🔒 Enhanced security for compliance requirements
- ⚡ Better performance with dedicated hardware

**Quick Start:**
```bash
# Quick guide available at
📄 QUICKSTART_SELF_HOSTED_RUNNER.md

# Detailed guide available at
📚 SELF_HOSTED_RUNNER_SETUP.md
```

**Available Workflows:**
- ✅ `self-hosted-ci.yml` - Automated build and test on your servers

### Deutsch 🇩🇪

#### Self-Hosted Runner

Dieses Repository unterstützt die Ausführung von CI/CD-Workflows auf Ihrer eigenen Infrastruktur mit GitHub Actions Self-Hosted Runners.

**Vorteile:**
- 🏢 Volle Kontrolle über die Ausführungsumgebung
- 💰 Kosteneinsparungen für umfangreiche Projekte
- 🔒 Verbesserte Sicherheit für Compliance-Anforderungen
- ⚡ Bessere Leistung mit dedizierter Hardware

**Schnellstart:**
```bash
# Kurzanleitung verfügbar unter
📄 QUICKSTART_SELF_HOSTED_RUNNER.md

# Detaillierte Anleitung verfügbar unter
📚 SELF_HOSTED_RUNNER_SETUP.md
```

**Verfügbare Workflows:**
- ✅ `self-hosted-ci.yml` - Automatisiertes Bauen und Testen auf Ihren Servern

---

### Contributions

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

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
