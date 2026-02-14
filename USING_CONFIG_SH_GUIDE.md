# دليل استخدام config.sh لإعداد العداد المخصص

## مقدمة
هذا الدليل يشرح كيفية استخدام ملف config.sh الذي قمت بتنزيله لإعداد العداد المخصص لمشروعك.

## المتطلبات الأساسية
- خادم Linux (Ubuntu 20.04 أو أحدث موصى به)
- اتصال بالإنترنت
- صلاحيات المستخدم المسؤول (sudo) على الخادم
- رمز تسجيل من GitHub (يجب الحصول عليه من إعدادات المستودع)

## الخطوات التفصيلية

### 1. الحصول على رمز التسجيل من GitHub
1. افتح المتصفح وانتقل إلى: https://github.com/zedanazad43/stp/settings/actions/runners
2. انقر على زر "New self-hosted runner"
3. اختر نظام التشغيل: Linux والبنية: x64
4. انسخ الرمز المقدم (سيكون له صيغة مشابهة: `AAB1234567890abcdef1234567890abcdef1234567890abcdef12345678`)

### 2. نقل ملفات العداد إلى الخادم
1. قم بإنشاء مجلد للعداد على الخادم:
   ```bash
   mkdir actions-runner && cd actions-runner
   ```
2. قم بنقل محتويات مجلد المؤقت (Rar$DIa22900.1791.rartemp) إلى مجلد actions-runner الجديد

### 3. جعل ملف config.sh قابلاً للتنفيذ
```bash
cd actions-runner
chmod +x config.sh
```

### 4. تشغيل config.sh لتكوين العداد
```bash
./config.sh --url https://github.com/zedanazad43/stp --token YOUR_TOKEN
```
- استبدل `YOUR_TOKEN` بالرمز الذي نسخته في الخطوة 1
- عند المطالبة بالتسميات (labels)، أدخل: `self-hosted,linux`

### 5. تشغيل العداد كخدمة
```bash
sudo ./svc.sh install
sudo ./svc.sh start
sudo ./svc.sh status
```

### 6. التحقق من نجاح الإعداد
1. ارجع إلى صفحة GitHub (https://github.com/zedanazad43/stp/settings/actions/runners)
2. يجب أن يظهر العداد الجديد في قائمة "Self-hosted runners" مع الحالة "online"

## استكشاف الأخطاء وإصلاحها

### مشكلة: "Must not run with sudo"
- لا تشغل config.sh مباشرة باستخدام sudo
- إذا كنت بحاجة إلى صلاحيات المسؤول، قم بتعيين متغير البيئة:
  ```bash
  RUNNER_ALLOW_RUNASROOT=1 ./config.sh --url https://github.com/zedanazad43/stp --token YOUR_TOKEN
  ```

### مشكلة: "Dependencies is missing for Dotnet Core 6.0"
- قم بتثبيت الاعتماديات المفقودة:
  ```bash
  sudo ./bin/installdependencies.sh
  ```

### مشكلة: العداد غير متصل
- تحقق من حالة الخدمة:
  ```bash
  sudo ./svc.sh status
  ```
- أعد تشغيل الخدمة:
  ```bash
  sudo ./svc.sh restart
  ```
- راقب سجلات الخدمة:
  ```bash
  sudo journalctl -u actions-runner.service -f
  ```

## تحديث العداد
لتحديث العداد إلى أحدث إصدار:
```bash
cd actions-runner
sudo ./svc.sh stop
sudo ./svc.sh uninstall
sudo ./config.sh remove --token YOUR_TOKEN
# ثم كرر الخطوات 2-5
```

## نصائح إضافية
1. تأكد من أن الخادم لديه موارد كافية (CPU, RAM)
2. قم بتغيير كلمة مرور SSH بانتظام
3. استخدم جدار حماية (firewall) لحماية الخادم
4. قم بتحديث نظام التشغيل بانتregel
