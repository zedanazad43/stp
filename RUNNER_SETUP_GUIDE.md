# دليل إعداد العداد المخصص (Self-Hosted Runner)

## مقدمة
هذا الدليل سيساعدك على إعداد العداد المخصص لمشروعك خطوة بخطوة. العداد المخصص سيسمح لك بتشغيل سير العمل الخاص بك على خادم خاص بك بدلاً من استخدام العداد الافتراضي من GitHub.

## المتطلبات الأساسية
- خادم Linux (Ubuntu 20.04 أو أحدث موصى به)
- اتصال بالإنترنت
- صلاحيات المستخدم المسؤول (sudo) على الخادم

## الخطوات التفصيلية

### 1. الدخول إلى إعدادات المستودع على GitHub
1. افتح المتصفح وانتقل إلى مستودعك: https://github.com/zedanazad43/stp
2. انقر على علامة التبويب **Settings** في القائمة العلوية
3. من القائمة الجانبية، اختر **Actions** ثم **Runners**
4. انقر على زر **New self-hosted runner**

### 2. اختيار نظام التشغيل والبنية
1. اختر نظام التشغيل: **Linux**
2. اختر البنية: **x64** (أو البنية المناسبة لخادمك)

### 3. تنزيل العداد
1. على خادمك، أنشئ مجلدًا للعداد:
   ```bash
   mkdir actions-runner && cd actions-runner
   ```
2. قم بتنزيل أحدث إصدار من العداد:
   ```bash
   curl -o actions-runner-linux-x64-2.311.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-linux-x64-2.311.0.tar.gz
   ```
3. قم باستخراج الملفات:
   ```bash
   tar xzf ./actions-runner-linux-x64-2.311.0.tar.gz
   ```

### 4. تكوين العداد
1. قم بتشغيل أمر التكوين باستخدام الرمز الذي قدمه GitHub:
   ```bash
   ./config.sh --url https://github.com/zedanazad43/stp --token YOUR_TOKEN
   ```
   - استبدل `YOUR_TOKEN` بالرمز الفعلي الذي قدمه GitHub
   - عند المطالبة بالتسميات (labels)، أدخل: `self-hosted,linux`

### 5. تشغيل العداد كخدمة
1. قم بتثبيت الخدمة:
   ```bash
   sudo ./svc.sh install
   ```
2. ابدأ الخدمة:
   ```bash
   sudo ./svc.sh start
   ```
3. تحقق من حالة الخدمة:
   ```bash
   sudo ./svc.sh status
   ```

### 6. التحقق من نجاح الإعداد
1. ارجع إلى صفحة GitHub (Settings > Actions > Runners)
2. يجب أن يظهر العداد الجديد في قائمة "Self-hosted runners" مع الحالة "online"

## استكشاف الأخطاء وإصلاحها

### 1. العداد لا يظهر في GitHub
- تأكد من أن الرمز (token) صحيح وغير منتهي الصلاحية
- تحقق من اتصال الخادم بالإنترنت
- تأكد من أنك تستخدم الإصدار الصحيح من العداد

### 2. العداد غير متصل
- تحقق من حالة الخدمة: `sudo ./svc.sh status`
- أعد تشغيل الخدمة: `sudo ./svc.sh restart`
- تحقق من سجلات الخدمة: `sudo journalctl -u actions-runner.service`

### 3. مشاكل في تنفيذ سير العمل
- تأكد من أن التسميات (labels) صحيحة: `self-hosted,linux`
- تحقق من أن جميع المتطلبات المذكورة في سير العمل مثبتة على الخادم
- راقب سجلات العداد: `sudo journalctl -u actions-runner.service -f`

## نصائح إضافية

### أمان العداد
1. قم بتغيير ملكية مجلد العداد:
   ```bash
   sudo chown -R root:root /actions-runner
   ```
2. قم بتقييد الوصول إلى مجلد العداد
3. قم بتحديث العداد بانتظام:
   ```bash
   cd actions-runner
   sudo ./svc.sh stop
   sudo ./svc.sh uninstall
   sudo ./config.sh remove --token YOUR_TOKEN
   # ثم كرر الخطوات 3-5
   ```

### تحسينات الأداء
1. تأكد من أن الخادم لديه موارد كافية (CPU, RAM)
2. استخدم خادمًا قريبًا من موقع المستخدمين
3. قم بتعديل إعدادات النظام حسب احتياجات سير العمل

## المراجع
- [GitHub Self-Hosted Runner Documentation](https://docs.github.com/en/actions/hosting-your-own-runners/about-self-hosted-runners)
- [GitHub Self-Hosted Runner Installation Guide](https://docs.github.com/en/actions/hosting-your-own-runners/adding-self-hosted-runners)
