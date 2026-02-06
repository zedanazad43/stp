# Self-Hosted Runner Setup | إعداد العداء المستضاف ذاتيًا

## العربية 🇸🇦

### نظرة عامة
هذا المستند يشرح كيفية إعداد عداء GitHub Actions مستضاف ذاتيًا لهذا المستودع.

### المتطلبات الأساسية
- خادم Linux (Ubuntu 20.04 أو أحدث موصى به)
- لا يقل عن 2GB RAM
- مساحة قرص 10GB على الأقل
- اتصال إنترنت مستقر

### خطوات التثبيت

1. **انتقل إلى إعدادات المستودع**
   - افتح https://github.com/zedanazad43/stp/settings/actions/runners
   - انقر على "New self-hosted runner"

2. **اختر نظام التشغيل والبنية**
   - نظام التشغيل: Linux
   - البنية: x64 (أو حسب خادمك)

3. **قم بتنزيل وتكوين العداء**
   ```bash
   # إنشاء مجلد للعداء
   mkdir actions-runner && cd actions-runner
   
   # تنزيل أحدث إصدار من العداء
   curl -o actions-runner-linux-x64-2.311.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-linux-x64-2.311.0.tar.gz
   
   # استخراج الملفات
   tar xzf ./actions-runner-linux-x64-2.311.0.tar.gz
   ```

4. **قم بتكوين العداء**
   ```bash
   # استخدم الأمر المقدم من GitHub (سيحتوي على رمز التسجيل الخاص بك)
   ./config.sh --url https://github.com/zedanazad43/stp --token YOUR_TOKEN
   
   # أضف التسميات المطلوبة
   # عند المطالبة بالتسميات، أدخل: self-hosted,linux
   ```

5. **قم بتشغيل العداء كخدمة**
   ```bash
   # تثبيت الخدمة
   sudo ./svc.sh install
   
   # بدء الخدمة
   sudo ./svc.sh start
   
   # التحقق من الحالة
   sudo ./svc.sh status
   ```

### التحقق
بعد التثبيت، تحقق من أن العداء يظهر كـ "Idle" في:
https://github.com/zedanazad43/stp/settings/actions/runners

---

## English 🇬🇧

### Overview
This document explains how to set up a self-hosted GitHub Actions runner for this repository.

### Prerequisites
- Linux server (Ubuntu 20.04 or newer recommended)
- At least 2GB RAM
- Minimum 10GB disk space
- Stable internet connection

### Installation Steps

1. **Navigate to Repository Settings**
   - Open https://github.com/zedanazad43/stp/settings/actions/runners
   - Click "New self-hosted runner"

2. **Choose Operating System and Architecture**
   - Operating System: Linux
   - Architecture: x64 (or match your server)

3. **Download and Configure the Runner**
   ```bash
   # Create a folder for the runner
   mkdir actions-runner && cd actions-runner
   
   # Download the latest runner version
   curl -o actions-runner-linux-x64-2.311.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-linux-x64-2.311.0.tar.gz
   
   # Extract the installer
   tar xzf ./actions-runner-linux-x64-2.311.0.tar.gz
   ```

4. **Configure the Runner**
   ```bash
   # Use the command provided by GitHub (will contain your registration token)
   ./config.sh --url https://github.com/zedanazad43/stp --token YOUR_TOKEN
   
   # Add required labels
   # When prompted for labels, enter: self-hosted,linux
   ```

5. **Run the Runner as a Service**
   ```bash
   # Install the service
   sudo ./svc.sh install
   
   # Start the service
   sudo ./svc.sh start
   
   # Check status
   sudo ./svc.sh status
   ```

### Verification
After installation, verify the runner appears as "Idle" at:
https://github.com/zedanazad43/stp/settings/actions/runners

---

## Deutsch 🇩🇪

### Übersicht
Dieses Dokument erklärt, wie man einen selbst gehosteten GitHub Actions Runner für dieses Repository einrichtet.

### Voraussetzungen
- Linux-Server (Ubuntu 20.04 oder neuer empfohlen)
- Mindestens 2GB RAM
- Mindestens 10GB Speicherplatz
- Stabile Internetverbindung

### Installationsschritte

1. **Zu den Repository-Einstellungen navigieren**
   - Öffnen Sie https://github.com/zedanazad43/stp/settings/actions/runners
   - Klicken Sie auf "New self-hosted runner"

2. **Betriebssystem und Architektur wählen**
   - Betriebssystem: Linux
   - Architektur: x64 (oder passend zu Ihrem Server)

3. **Runner herunterladen und konfigurieren**
   ```bash
   # Ordner für den Runner erstellen
   mkdir actions-runner && cd actions-runner
   
   # Neueste Runner-Version herunterladen
   curl -o actions-runner-linux-x64-2.311.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-linux-x64-2.311.0.tar.gz
   
   # Installer extrahieren
   tar xzf ./actions-runner-linux-x64-2.311.0.tar.gz
   ```

4. **Runner konfigurieren**
   ```bash
   # Verwenden Sie den von GitHub bereitgestellten Befehl (enthält Ihr Registrierungs-Token)
   ./config.sh --url https://github.com/zedanazad43/stp --token YOUR_TOKEN
   
   # Erforderliche Labels hinzufügen
   # Bei der Aufforderung nach Labels eingeben: self-hosted,linux
   ```

5. **Runner als Dienst ausführen**
   ```bash
   # Dienst installieren
   sudo ./svc.sh install
   
   # Dienst starten
   sudo ./svc.sh start
   
   # Status überprüfen
   sudo ./svc.sh status
   ```

### Überprüfung
Nach der Installation überprüfen Sie, ob der Runner als "Idle" angezeigt wird unter:
https://github.com/zedanazad43/stp/settings/actions/runners

---

## Additional Notes | ملاحظات إضافية | Zusätzliche Hinweise

### Security Considerations | اعتبارات الأمان | Sicherheitsüberlegungen

**العربية**: من المهم تأمين العداء المستضاف ذاتيًا:
- استخدم حسابات مستخدم محدودة الصلاحيات
- قم بتحديث نظام التشغيل والعداء بانتظام
- استخدم جدار حماية لحماية الخادم

**English**: Important security considerations for self-hosted runners:
- Use limited permission user accounts
- Keep the OS and runner updated regularly
- Use a firewall to protect the server

**Deutsch**: Wichtige Sicherheitsaspekte für selbst gehostete Runner:
- Verwenden Sie Benutzerkonten mit eingeschränkten Berechtigungen
- Halten Sie das Betriebssystem und den Runner regelmäßig aktuell
- Verwenden Sie eine Firewall zum Schutz des Servers

### Workflow Usage | استخدام سير العمل | Workflow-Nutzung

The self-hosted runner is configured with the label `[self-hosted, linux]` and will automatically pick up jobs from the `self-hosted-ci.yml` workflow.

العداء المستضاف ذاتيًا مكون بالتسمية `[self-hosted, linux]` وسيلتقط تلقائيًا المهام من سير العمل `self-hosted-ci.yml`.

Der selbst gehostete Runner ist mit dem Label `[self-hosted, linux]` konfiguriert und übernimmt automatisch Jobs aus dem `self-hosted-ci.yml` Workflow.
