# دليل كامل لإعداد العداد المخصص (Self-Hosted Runner)

## الخطوة 1: الحصول على رمز التسجيل
1. افتح المتصفح وانتقل إلى: https://github.com/zedanazad43/stp/settings/actions/runners
2. انقر على زر "New self-hosted runner"
3. اختر نظام التشغيل: Linux والبنية: x64
4. انسخ الرمز المقدم في الخطوة 3 (سيكون له صيغة مشابهة: `AAB1234567890abcdef1234567890abcdef1234567890abcdef12345678`)

## الخطوة 2: تسجيل الدخول إلى خادمك
1. استخدم SSH أو أي طريقة أخرى للاتصال بخادمك Linux:
   ```bash
   ssh username@your-server-ip
   ```

## الخطوة 3: إنشاء مجلد للعداد
```bash
mkdir actions-runner && cd actions-runner
```

## الخطوة 4: تنزيل العداد
```bash
curl -o actions-runner-linux-x64-2.311.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-linux-x64-2.311.0.tar.gz
```

## الخطوة 5: استخراج الملفات
```bash
tar xzf ./actions-runner-linux-x64-2.311.0.tar.gz
```

## الخطوة 6: تكوين العداد
```bash
./config.sh --url https://github.com/zedanazad43/stp --token YOUR_TOKEN
```
- استبدل `YOUR_TOKEN` بالرمز الذي نسخته في الخطوة 1
- عند المطالبة بالتسميات (labels)، أدخل: `self-hosted,linux`

## الخطوة 7: تشغيل العداد كخدمة
```bash
sudo ./svc.sh install
sudo ./svc.sh start
sudo ./svc.sh status
```

## الخطوة 8: التحقق من نجاح الإعداد
1. ارجع إلى صفحة GitHub (https://github.com/zedanazad43/stp/settings/actions/runners)
2. يجب أن يظهر العداد الجديد في قائمة "Self-hosted runners" مع الحالة "online"

## استكشاف الأخطاء وإصلاحها

### مشكلة: "Error getting API token from config"
1. تأكد من وجود الرمز الصحيح
2. تحقق من صحة اتصالك بالإنترنت
3. تأكد من أنك في المجلد الصحيح للعداد:
   ```bash
   cd actions-runner
   ```

### مشكلة: العداد غير متصل
1. تحقق من حالة الخدمة:
   ```bash
   sudo ./svc.sh status
   ```
2. أعد تشغيل الخدمة:
   ```bash
   sudo ./svc.sh restart
   ```
3. راقب سجلات الخدمة:
   ```bash
   sudo journalctl -u actions-runner.service -f
   ```

### مشكلة: سير العمل لا يعمل
1. تأكد من أن التسميات (labels) صحيحة: `self-hosted,linux`
2. تحقق من أن جميع المتطلبات مثبتة على الخادم (Node.js, npm, إلخ)
3. راقب سجلات العداد:
   ```bash
   sudo journalctl -u actions-runner.service -f
   ```

## نصائح إضافية

### تحديث العداد بانتظام
```bash
cd actions-runner
sudo ./svc.sh stop
sudo ./svc.sh uninstall
sudo ./config.sh remove --token YOUR_TOKEN
# ثم كرر الخطوات 3-7
```

### تغيير ملكية مجلد العداد
```bash
sudo chown -R root:root /actions-runner
```

### أمان العداد
1. قم بتغيير كلمة مرور SSH بانتظام
2. استخدم جدار حماية (firewall) لحماية الخادم
3. قم بتقييد الوصول إلى مجلد العداد
4. قم بتحديث نظام التشغيل بانتظام

## المتطلبات الأساسية للخادم
- نظام التشغيل: Linux (Ubuntu 20.04 أو أحدث موصى به)
- RAM: 2GB على الأقل
- مساحة القرص: 10GB على الأقل
- Node.js 18.x أو أحدث (مطلوب لبناء التطبيق)
- اتصال إنترنت مستقر
