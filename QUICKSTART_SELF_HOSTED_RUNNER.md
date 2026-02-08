# دليل البدء السريع للعداء المستضاف ذاتيًا | Self-Hosted Runner Quick Start

## 🚀 البدء السريع | Quick Start | Schnellstart

### العربية 🇸🇦

#### الخطوات السريعة للإعداد

```bash
# 1. على خادمك، إنشاء مجلد العداء
mkdir actions-runner && cd actions-runner

# 2. تنزيل وتثبيت العداء (استبدل VERSION بأحدث إصدار)
curl -o actions-runner-linux-x64-2.311.0.tar.gz -L \
  https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-linux-x64-2.311.0.tar.gz
tar xzf ./actions-runner-linux-x64-2.311.0.tar.gz

# 3. تكوين العداء (احصل على TOKEN من صفحة إعدادات GitHub)
./config.sh --url https://github.com/zedanazad43/stp --token YOUR_REGISTRATION_TOKEN
# عند المطالبة بالتسميات، أدخل: self-hosted,linux

# 4. تشغيل كخدمة
sudo ./svc.sh install
sudo ./svc.sh start
```

#### الحصول على رمز التسجيل (Registration Token)

1. انتقل إلى: https://github.com/zedanazad43/stp/settings/actions/runners
2. انقر على "New self-hosted runner"
3. انسخ الأمر `./config.sh` المعروض (يحتوي على الرمز)

#### التحقق من التشغيل

```bash
# التحقق من حالة الخدمة
sudo ./svc.sh status

# عرض سجلات العداء
journalctl -u actions.runner.*
```

#### ماذا يحدث بعد الإعداد؟

✅ العداء المستضاف ذاتيًا الآن جاهز وفي حالة انتظار  
✅ سيتم تشغيل سير العمل `self-hosted-ci.yml` تلقائيًا عند:
   - دفع تغييرات إلى فرع main
   - إنشاء طلب سحب (Pull Request) لفرع main

✅ سيقوم سير العمل بـ:
   - تثبيت التبعيات (npm ci)
   - تشغيل الفحوصات (lint)
   - تشغيل الاختبارات (tests)
   - بناء التطبيق (build)
   - بناء صورة Docker (على main فقط)

---

### English 🇬🇧

#### Quick Setup Steps

```bash
# 1. On your server, create runner directory
mkdir actions-runner && cd actions-runner

# 2. Download and install runner (replace VERSION with latest)
curl -o actions-runner-linux-x64-2.311.0.tar.gz -L \
  https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-linux-x64-2.311.0.tar.gz
tar xzf ./actions-runner-linux-x64-2.311.0.tar.gz

# 3. Configure runner (get TOKEN from GitHub settings page)
./config.sh --url https://github.com/zedanazad43/stp --token YOUR_REGISTRATION_TOKEN
# When prompted for labels, enter: self-hosted,linux

# 4. Run as service
sudo ./svc.sh install
sudo ./svc.sh start
```

#### Getting the Registration Token

1. Go to: https://github.com/zedanazad43/stp/settings/actions/runners
2. Click "New self-hosted runner"
3. Copy the `./config.sh` command shown (contains the token)

#### Verify It's Running

```bash
# Check service status
sudo ./svc.sh status

# View runner logs
journalctl -u actions.runner.*
```

#### What Happens After Setup?

✅ Self-hosted runner is now ready and idle  
✅ The `self-hosted-ci.yml` workflow will automatically run when:
   - Changes are pushed to main branch
   - Pull requests are created targeting main branch

✅ The workflow will:
   - Install dependencies (npm ci)
   - Run linter checks (lint)
   - Run tests (tests)
   - Build application (build)
   - Build Docker image (on main only)

---

### Deutsch 🇩🇪

#### Schnelle Einrichtungsschritte

```bash
# 1. Auf Ihrem Server, Runner-Verzeichnis erstellen
mkdir actions-runner && cd actions-runner

# 2. Runner herunterladen und installieren (VERSION durch neueste ersetzen)
curl -o actions-runner-linux-x64-2.311.0.tar.gz -L \
  https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-linux-x64-2.311.0.tar.gz
tar xzf ./actions-runner-linux-x64-2.311.0.tar.gz

# 3. Runner konfigurieren (TOKEN von GitHub-Einstellungsseite holen)
./config.sh --url https://github.com/zedanazad43/stp --token YOUR_REGISTRATION_TOKEN
# Bei Aufforderung nach Labels eingeben: self-hosted,linux

# 4. Als Dienst ausführen
sudo ./svc.sh install
sudo ./svc.sh start
```

#### Registrierungs-Token erhalten

1. Gehe zu: https://github.com/zedanazad43/stp/settings/actions/runners
2. Klicke auf "New self-hosted runner"
3. Kopiere den angezeigten `./config.sh` Befehl (enthält Token)

#### Überprüfen der Ausführung

```bash
# Dienststatus prüfen
sudo ./svc.sh status

# Runner-Logs anzeigen
journalctl -u actions.runner.*
```

#### Was passiert nach der Einrichtung?

✅ Self-hosted Runner ist jetzt bereit und im Leerlauf  
✅ Der `self-hosted-ci.yml` Workflow wird automatisch ausgeführt bei:
   - Änderungen werden zum main-Branch gepusht
   - Pull-Requests werden für main-Branch erstellt

✅ Der Workflow wird:
   - Abhängigkeiten installieren (npm ci)
   - Linter-Prüfungen ausführen (lint)
   - Tests ausführen (tests)
   - Anwendung bauen (build)
   - Docker-Image bauen (nur auf main)

---

## 🔧 استكشاف الأخطاء | Troubleshooting | Fehlerbehebung

### العربية 🇸🇦

**المشكلة: العداء لا يظهر في GitHub**
```bash
# تحقق من حالة الخدمة
sudo ./svc.sh status
# إعادة تشغيل الخدمة
sudo ./svc.sh restart
```

**المشكلة: فشل سير العمل**
- تحقق من أن Node.js 18+ مثبت: `node --version`
- تحقق من سجلات العداء: `journalctl -u actions.runner.* -f`

### English 🇬🇧

**Problem: Runner doesn't appear in GitHub**
```bash
# Check service status
sudo ./svc.sh status
# Restart service
sudo ./svc.sh restart
```

**Problem: Workflow fails**
- Verify Node.js 18+ is installed: `node --version`
- Check runner logs: `journalctl -u actions.runner.* -f`

### Deutsch 🇩🇪

**Problem: Runner erscheint nicht in GitHub**
```bash
# Dienststatus prüfen
sudo ./svc.sh status
# Dienst neu starten
sudo ./svc.sh restart
```

**Problem: Workflow schlägt fehl**
- Überprüfen Sie Node.js 18+ Installation: `node --version`
- Runner-Logs prüfen: `journalctl -u actions.runner.* -f`

---

## 📚 المزيد من المعلومات | More Information | Weitere Informationen

للحصول على تعليمات مفصلة، راجع: `SELF_HOSTED_RUNNER_SETUP.md`  
For detailed instructions, see: `SELF_HOSTED_RUNNER_SETUP.md`  
Für detaillierte Anweisungen siehe: `SELF_HOSTED_RUNNER_SETUP.md`

---

## 🔒 ملاحظات الأمان | Security Notes | Sicherheitshinweise

### العربية 🇸🇦
⚠️ استخدم حساب مستخدم محدود الصلاحيات لتشغيل العداء  
⚠️ قم بتحديث العداء ونظام التشغيل بانتظام  
⚠️ استخدم جدار حماية لحماية الخادم  

### English 🇬🇧
⚠️ Use a limited permission user account to run the runner  
⚠️ Keep runner and OS updated regularly  
⚠️ Use a firewall to protect the server  

### Deutsch 🇩🇪
⚠️ Verwenden Sie ein Benutzerkonto mit eingeschränkten Berechtigungen  
⚠️ Halten Sie Runner und OS regelmäßig aktuell  
⚠️ Verwenden Sie eine Firewall zum Schutz des Servers  
