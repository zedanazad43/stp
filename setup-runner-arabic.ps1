
# نص إعداد GitHub Actions Runner

Write-Host "نص إعداد GitHub Actions Runner" -ForegroundColor Green
Write-Host "=================================" -ForegroundColor Green

# الخطوات لإعداد Runner
Write-Host "الخطوة 1: الحصول على عنوان URL ورمز Runner من GitHub" -ForegroundColor Yellow
Write-Host "- سجل الدخول إلى مستودعك على GitHub" -ForegroundColor White
Write-Host "- اذهب إلى Settings > Actions > Runners" -ForegroundColor White
Write-Host "- انقر على 'New runner' للحصول على العنوان والرمز" -ForegroundColor White
Write-Host ""

Write-Host "الخطوة 2: فك ضغط Runner الذي تم تنزيله" -ForegroundColor Yellow
Write-Host "تم تنزيل الـ runner بالفعل، الآن سنقوم بفك ضغطه" -ForegroundColor White
tar -xzf actions-runner-linux-x64-2.331.0.tar.gz
Write-Host "تم فك الضغط بنجاح" -ForegroundColor Green
Write-Host ""

Write-Host "الخطوة 3: تكوين الـ Runner" -ForegroundColor Yellow
Write-Host "استخدم الأمر التالي مع عنوان URL ورمزك الخاص:" -ForegroundColor White
Write-Host ".\config.cmd --url YOUR_REPO_URL --token YOUR_RUNNER_TOKEN" -ForegroundColor Cyan
Write-Host ""

Write-Host "الخطوة 4: تشغيل الـ Runner" -ForegroundColor Yellow
Write-Host "بعد التكوين، يمكنك تشغيل الـ Runner بالأمر:" -ForegroundColor White
Write-Host ".un.cmd" -ForegroundColor Cyan
Write-Host ""

Write-Host "ملاحظة: بما أنك قمت بتنزيل نسخة Linux، قد تحتاج إلى استخدام WSL لتشغيله على Windows" -ForegroundColor Yellow
Write-Host "أو تنزيل النسخة المخصصة لـ Windows من: https://github.com/actions/runner/releases" -ForegroundColor White
