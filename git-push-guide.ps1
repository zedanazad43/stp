
# دليل إرسال التغييرات إلى GitHub لبدء استخدام سير العمل

Write-Host "دليل إرسال التغييرات إلى GitHub" -ForegroundColor Green
Write-Host "====================================" -ForegroundColor Green

Write-Host "الخطوة 1: فحص حالة Git الحالية" -ForegroundColor Yellow
Write-Host "------------------------------------" -ForegroundColor Yellow
Write-Host "تحقق من أنك في المجلد الصحيح وحالة Git:"
Write-Host "cd C:\Users\azadz\OneDrive\المستندات\GitHub\stp"
Write-Host "git status"
Write-Host ""

Write-Host "الخطوة 2: إضافة جميع التغييرات إلى منطقة التسجيل" -ForegroundColor Yellow
Write-Host "-----------------------------------------------" -ForegroundColor Yellow
Write-Host "استخدم الأمر الت لإضافة جميع التغييرات:"
Write-Host "git add ."
Write-Host ""

Write-Host "الخطوة 3: إنشاء commit للتغييرات" -ForegroundColor Yellow
Write-Host "---------------------------------" -ForegroundColor Yellow
Write-Host "أنشئ commit مع رسالة مناسبة:"
Write-Host "git commit -m \"إضافة إعداد GitHub Actions Runner لنشر المشروع\""
Write-Host ""

Write-Host "الخطوة 4: دفع التغييرات إلى GitHub" -ForegroundColor Yellow
Write-Host "----------------------------------------" -ForegroundColor Yellow
Write-Host "أرسل التغييرات إلى مستودعك على GitHub:"
Write-Host "git push origin main"
Write-Host ""

Write-Host "الخطوة 5: مراقبة سير العمل في GitHub" -ForegroundColor Yellow
Write-Host "----------------------------------------" -ForegroundColor Yellow
Write-Host "بعد دفع التغييرات:"
Write-Host "1. اذهب إلى مستودعك على GitHub"
Write-Host "2. انقر على تبويب 'Actions'"
Write-Host "3. يجب أن ترى سير العمل الجاري تنفيذه"
Write-Host "4. انتظر حتى يكتمل التنفيذ"
Write-Host ""

Write-Host "ملاحظات مهمة:" -ForegroundColor Yellow
Write-Host "---------------" -ForegroundColor Yellow
Write-Host "- تأكد من أنك تستخدم الفرع الصحيح (main/master)" -ForegroundColor White
Write-Host "- إذا واجهت مشاكل في المصادقة، قد تحتاج إلى إعادة تعيينها" -ForegroundColor White
Write-Host "- تأكد من أن Runner الخاص بك يعمل بشكل صحيح" -ForegroundColor White
Write-Host "- إذا فشل سير العمل، تحقق من سجلات الأخطاء في قسم 'Actions'" -ForegroundColor White
