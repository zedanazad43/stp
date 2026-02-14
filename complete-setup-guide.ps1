
# إعداد GitHub Actions Runner بالكامل ونشر المشروع

Write-Host "دليل إعداد GitHub Actions Runner ونشر المشروع" -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Green

Write-Host "الخطوة 1: الحصول على عنوان URL ورمز Runner من GitHub" -ForegroundColor Yellow
Write-Host "-------------------------------------------------------" -ForegroundColor Yellow
Write-Host "1. سجل الدخول إلى حساب GitHub الخاص بك" -ForegroundColor White
Write-Host "2. اذهب إلى مستودعك (repository)" -ForegroundColor White
Write-Host "3. من القمة اليمنى، انقر على 'Settings'" -ForegroundColor White
Write-Host "4. في القمة اليسرى، انقر على 'Actions'" -ForegroundColor White
Write-Host "5. في القمة اليسرى، انقر على 'Runners'" -ForegroundColor White
Write-Host "6. انقر على زر 'New runner'" -ForegroundColor White
Write-Host "7. انسخ عنوان URL ورمز Runner الظاهرين لك" -ForegroundColor White
Write-Host ""

Write-Host "الخطوة 2: فك ضغط Runner وتكوينه" -ForegroundColor Yellow
Write-Host "----------------------------------------" -ForegroundColor Yellow
Write-Host "1. تأكد من أنك في مجلد actions-runner:" -ForegroundColor White
Write-Host "   cd C:\Users\azadz\actions-runner" -ForegroundColor White
Write-Host "2. قم بفك ضغط Runner إذا لم تكن قد قمت بذلك بالفعل:" -ForegroundColor White
Write-Host "   tar -xzf actions-runner-linux-x64-2.331.0.tar.gz" -ForegroundColor White
Write-Host "3. قم بتكوين الـ Runner باستخدام عنوان URL ورمزك:" -ForegroundColor White
Write-Host "   .\config.cmd --url YOUR_REPO_URL --token YOUR_RUNNER_TOKEN" -ForegroundColor White
Write-Host "   استبدل YOUR_REPO_URL وYOUR_RUNNER_TOKEN بالقيم الفعلية" -ForegroundColor White
Write-Host ""

Write-Host "الخطوة 3: تشغيل الـ Runner" -ForegroundColor Yellow
Write-Host "-----------------------------" -ForegroundColor Yellow
Write-Host "1. بعد التكوين بنجاح، قم بتشغيل الـ Runner:" -ForegroundColor White
Write-Host "   .\run.cmd" -ForegroundColor White
Write-Host "2. للحفاظ على تشغيل الـ Runner بشكل دائم، قد تحتاج إلى تشغيله كخدمة" -ForegroundColor White
Write- ""

Write-Host "الخطوة 4: إنشاء سير عمل (Workflow) لنشر المشروع" -ForegroundColor Yellow
Write-Host "-----------------------------------------------------" -ForegroundColor Yellow
Write-Host "1. في مستودع GitHub، أنشئ مجلدًا جديدًا باسم '.github' إذا لم يكن موجودًا" -ForegroundColor White
Write-Host "2. داخل '.github'، أنشئ مجلدًا باسم 'workflows'" -ForegroundColor White
Write-Host "3. داخل 'workflows'، أنشئ ملفًا جديدًا باسم 'publish.yml'" -ForegroundColor White
Write-Host "4. أضف المحتوى التالي إلى الملف (مع تعديله حسب احتياجات مشروعك):" -ForegroundColor White
Write-Host ""

# إنشاء محتوى ملف سير العمل
$workflowContent = @"
name: Publish Project

on:
  push:
    branches: [ main, master ]

jobs:
  build-and-deploy:
    runs-on: self-hosted
    steps:
    - name: Checkout repository
      uses: actions/checkout@v3

    - name: Setup Node.js
      uses: actions/setup-node@v3
      with:
        node-version: '18'
        cache: 'npm'

    - name: Install dependencies
      run: npm install

    - name: Build project
      run: npm run build

    - name: Deploy project
      run: |
        # أضف أوامر النشر الخاصة بمشروعك هنا
        # مثال: rsync -av dist/ /path/to/deployment/
        echo "Deployment completed successfully"
"@

Write-Host $workflowContent -ForegroundColor Cyan
Write-Host ""

Write-Host "الخطوة 5: دمج التغييرات واختبار الـ Runner" -ForegroundColor Yellow
Write-Host "-----------------------------------------------" -ForegroundColor Yellow
Write-Host "1. قم بعمل commit للملفات وإرسالها إلى GitHub:" -ForegroundColor White
Write-Host "   git add ." -ForegroundColor White
Write-Host "   git commit -m 'Add GitHub Actions workflow'" -ForegroundColor White
Write-Host "   git push origin main" -ForegroundColor White
Write-Host "2. تحقق من تشغيل سير العمل في قسم 'Actions' في مستودعك على GitHub" -ForegroundColor White
Write-Host "3. تأكد من أن الـ Runner يعمل بشكل صحيح" -ForegroundColor White
Write-Host ""

Write-Host "ملاحظات مهمة:" -ForegroundColor Yellow
Write-Host "---------------" -ForegroundColor Yellow
Write-Host "- إذا كنت تستخدم Windows، قد تحتاج إلى تنزيل نسخة Windows من Runner بدلاً من نسخة Linux" -ForegroundColor White
Write-Host "- يمكنك تنزيل Runner الخاص بـ Windows من: https://github.com/actions/runner/releases" -ForegroundColor White
Write-Host "- تأكد من أن Runner لديه الأذونات اللازمة للوصول إلى ملفات المشروع" -ForegroundColor White
Write-Host "- قد تحتاج إلى إعداد متغيرات البيئة (environment variables) في سير العمل الخاص بك" -ForegroundColor White
Write-Host ""
