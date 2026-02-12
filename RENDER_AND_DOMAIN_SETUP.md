# 🚀 Render & Custom Domain Setup Guide | دليل إعداد Render والنطاق المخصص

## 📋 Prerequisites | المتطلبات

- [x] GitHub account (لديك بالفعل)
- [ ] Render account (سجل في render.com)
- [ ] Custom domain (اختياري - يمكنك شراء واحد)
- [ ] GitHub repository (لديك بالفعل: zedanazad43/stp)

---

## 🔌 Step 1: Deploy to Render | الخطوة 1: نشر على Render

### A. إنشاء حساب Render

1. اذهب إلى: https://render.com
2. اضغط **Sign up** أو **Sign in with GitHub**
3. استخدم حساب GitHub الخاص بك
4. وافق على الأذونات

### B. إنشاء خدمة ويب جديدة

1. في لوحة Render الرئيسية، اضغط **+ New**
2. اختر **Web Service**
3. اضغط **Connect a repository**
4. ابحث عن: `zedanazad43/stp`
5. اضغط **Connect**

### C. إعدادات النشر

**في صفحة إعدادات Web Service:**

| Setting | Value | Notes |
|---------|-------|-------|
| **Name** | `stampcoin-api` | اسم الخدمة |
| **Environment** | `Node` | النوع |
| **Build Command** | `npm install` | أمر البناء |
| **Start Command** | `npm start` | أمر البدء |
| **Plan** | Free or Starter | الخطة |

### D. تعيين متغيرات البيئة

1. اذهب إلى **Environment**
2. اضغط **Add Environment Variable**
3. أضف:

```
Key: SYNC_TOKEN
Value: your-secret-token-here
```

استخدم token قوي (مثال):
```bash
# على macOS/Linux
openssl rand -base64 32

# على Windows PowerShell
[Convert]::ToBase64String((1..32|ForEach-Object{[byte](Get-Random -Min 0 -Max 256)}))
```

### E. النشر

1. اضغط **Create Web Service**
2. Render سيبدأ البناء تلقائياً
3. انتظر 5-10 دقائق

**رابط API الخاص بك سيكون:**
```
https://stampcoin-api.onrender.com/sync
```

---

## 🌐 Step 2: GitHub Pages Configuration | الخطوة 2: إعدادات GitHub Pages

### A. تفعيل GitHub Pages

1. اذهب إلى مستودعك: https://github.com/zedanazad43/stp
2. اضغط **Settings**
3. اختر **Pages** من الجانب الأيسر
4. تحت **Source**، اختر:
   - **Deploy from a branch**
   - **Branch**: `main`
   - **Folder**: `/(root)`
5. اضغط **Save**

**موقعك سيكون متاحاً في:**
```
https://zedanazad43.github.io/stp/
```

### B. التحقق من النشر

1. اذهب إلى **Actions** في المستودع
2. يجب أن ترى workflow اسمه `Deploy to GitHub Pages`
3. إذا نجح، ستجد checkmark ✅

---

## 🎯 Step 3: Custom Domain Setup | الخطوة 3: إعداد النطاق المخصص

### خيار A: استخدام نطاق موجود لديك

#### 3A.1 شراء نطاق (إذا لم يكن لديك واحد)

اختر مسجل نطاق:
- **Namecheap**: https://www.namecheap.com
- **GoDaddy**: https://www.godaddy.com
- **Google Domains**: https://domains.google
- **Bluehost**: https://www.bluehost.com

**مثال**: شراء `stampcoin.com` (~$10/سنة)

#### 3A.2 إعداد سجل DNS

بعد شراء النطاق، أضف سجلات DNS:

**لـ GitHub Pages (الموقع):**

```
Type: CNAME
Name: www (أو leave blank)
Value: zedanazad43.github.io
TTL: 3600
```

أو (إذا كان متاحاً):

```
Type: A
IP: 185.199.108.153
IP: 185.199.109.153
IP: 185.199.110.153
IP: 185.199.111.153
```

**لـ Render API (تطبيق):**

إذا أردت subdomain للـ API (مثل `api.stampcoin.com`):

```
Type: CNAME
Name: api
Value: stampcoin-api.onrender.com
TTL: 3600
```

#### 3A.3 ربط النطاق مع GitHub Pages

1. اذهب إلى مستودعك: Settings → Pages
2. تحت **Custom domain**، أدخل:
   ```
   stampcoin.com
   (أو www.stampcoin.com)
   ```
3. اضغط **Save**
4. GitHub سيتحقق من التكوين (قد يستغرق دقائق)

#### 3A.4 تفعيل HTTPS

بعد حفظ النطاق:

1. اذهب إلى Settings → Pages
2. تحت **HTTPS**، اضغط **Enforce HTTPS**
3. انتظر دقائق (سيتم الحصول على شهادة تلقائياً)

---

### خيار B: استخدام نطاق Render المجاني (مؤقت)

إذا لم تريد شراء نطاق الآن:

1. في Render dashboard
2. اذهب إلى خدمتك `stampcoin-api`
3. انسخ الـ URL المجاني:
   ```
   https://stampcoin-api.onrender.com
   ```

---

## ✅ التحقق من النشر | Verification

### اختبر موقعك:

```bash
curl -L https://zedanazad43.github.io/stp/
# أو: https://stampcoin.com (إذا أضفت نطاق)
```

### اختبر API:

```bash
curl -X GET https://stampcoin-api.onrender.com/sync \
  -H "Authorization: Bearer your-sync-token" \
  -H "Content-Type: application/json"

# يجب أن يرد:
# {"todos":[]}
```

### اختبر في المتصفح:

```javascript
// في console المتصفح
fetch('https://stampcoin-api.onrender.com/sync', {
  headers: {
    'Authorization': 'Bearer your-sync-token'
  }
})
.then(r => r.json())
.then(d => console.log(d))
```

---

## 🔍 Troubleshooting | حل المشاكل

### مشكلة: GitHub Pages يعرض 404

**الحل:**
1. تحقق من أن العنوان الفرعي صحيح
2. تأكد من أن `index.html` موجود في `public/` أو الجذر
3. انتظر 1-2 دقيقة لاكتمال النشر

### مشكلة: Render لم يبدأ

**الحل:**
1. اذهب إلى Render dashboard
2. انظر إلى **Logs**
3. ابحث عن رسائل الخطأ
4. تأكد من أن `SYNC_TOKEN` معرّف

### مشكلة: CORS errors في المتصفح

**الحل:**
- يتم تفعيل CORS بالفعل في `server.js`
- تأكد من عنوان URL API صحيح
- حاول بدون slash نهائي

### مشكلة: النطاق المخصص لا يعمل

**الحل:**
1. تحقق من سجلات DNS (استخدم: `nslookup` أو `dig`)
2. انتظر 24-48 ساعة لانتشار DNS
3. في GitHub Pages، تحقق من أن النطاق في Settings

### مشكلة: HTTPS لا يعمل

**الحل:**
1. تأكد من تفعيل **Enforce HTTPS** في GitHub Pages
2. انتظر 24 ساعة للحصول على شهادة SSL
3. تحقق من أن سجل DNS صحيح

---

## 📊 Final URLs | الروابط النهائية

بعد الإعداد الكامل:

```
Website:     https://zedanazad43.github.io/stp/
             (أو: https://stampcoin.com إذا أضفت نطاق)

API:         https://stampcoin-api.onrender.com
             (أو: https://api.stampcoin.com إذا أضفت subdomain)

GitHub Repo: https://github.com/zedanazad43/stp
```

---

## 🎯 Recommended Domain Registrars | مسجلات النطاقات الموصى بها

| Registrar | Price | Support | Best For |
|-----------|-------|---------|----------|
| **Namecheap** | $8.88/year | ⭐⭐⭐⭐ | Cheap & reliable |
| **Google Domains** | $10-15/year | ⭐⭐⭐⭐ | Easy setup |
| **GoDaddy** | $10-15/year | ⭐⭐⭐ | Popular |
| **Bluehost** | $2.95/year* | ⭐⭐⭐ | Promotion |

*renewal price usually higher

---

## 💰 Estimated Costs | التكاليف المقدرة

### الحد الأدنى (بدون نطاق مخصص):

```
Render API     : FREE (free tier)
GitHub Pages   : FREE
─────────────────
Total          : $0/month
```

⚠️ **ملاحظة**: Render free tier ينام بعد 15 دقيقة من الخمول

### مع نطاق مخصص:

```
Render API     : FREE or $7/month (Starter)
GitHub Pages   : FREE
Domain         : $8-15/year (~$1/month)
─────────────────
Total          : $1/month or $7+/month
```

---

## ✨ Next Steps | الخطوات التالية

1. ✅ أنشئ حساب Render (مجاني)
2. ✅ انشر التطبيق على Render (5 دقائق)
3. ✅ تفعيل GitHub Pages (1 دقيقة)
4. ✅ اختبر الروابط
5. ⏳ اشتر نطاق (اختياري)
6. ⏳ أضف سجلات DNS
7. ⏳ ربط النطاق

---

## 🎊 Checklist

### Render Deployment:
- [ ] حساب Render مُنشأ
- [ ] المستودع متصل
- [ ] Build command: `npm install`
- [ ] Start command: `npm start`
- [ ] SYNC_TOKEN معرّف
- [ ] الخدمة مُنشرة بنجاح
- [ ] API يستجيب: `/sync`

### GitHub Pages:
- [ ] Pages مُفعّل
- [ ] Branch: `main`
- [ ] الموقع يحمل بدون أخطاء

### Custom Domain (اختياري):
- [ ] نطاق مشترى
- [ ] سجلات DNS مُضافة
- [ ] النطاق مرتبط مع GitHub
- [ ] HTTPS مُفعّل

---

## 🔗 Useful Links

**Render Documentation**: https://docs.render.com  
**GitHub Pages Docs**: https://docs.github.com/pages  
**DNS Setup Guide**: https://mxtoolbox.com  
**Namecheap**: https://www.namecheap.com  

---

**تم إعداد كل شيء! انشر على Render الآن في 5 دقائق!** 🚀
