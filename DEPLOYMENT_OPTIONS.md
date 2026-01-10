# النشر الخارجي - خيارات وخطوات

## 🎯 خيارات سريعة

| المنصة | التكلفة | الإعداد | الأداء | الموصى به |
|--------|--------|--------|--------|-----------|
| **Fly.io** | دولار واحد/شهر + ائتماني | سهل | ممتاز | ✅ نعم |
| **Railway** | $5-$20/شهر | سريع جداً | جيد | ✅ نعم |
| **Render** | مجاني (مع قيود) | متوسط | كافٍ | إذا كنت بدء |
| **Vercel** | مجاني (واجهة) | سريع | ممتاز | واجهة فقط |
| **IONOS VPS** | €2-3/شهر | معقد | عالي | للإنتاج الكامل |

---

## 📋 المتطلبات المشتركة

### بيئة الإنتاج (`.env.deploy`)

```bash
# 1. نسخ النموذج
cp .env.deploy.example .env.deploy

# 2. ملء المتغيرات الأساسية
cat > .env.deploy << 'EOF'
# Database
MYSQL_ROOT_PASSWORD=$(openssl rand -base64 32)
MYSQL_PASSWORD=$(openssl rand -base64 32)
DATABASE_URL=mysql://stampcoin:${MYSQL_PASSWORD}@mysql-host:3306/stampcoin

# Security
JWT_SECRET=$(openssl rand -hex 32)
SESSION_SECRET=$(openssl rand -hex 32)

# CEX.io
CEX_USER_ID=162853244
CEX_WALLET_ADDRESS=<add-your-cex-wallet>

# Payment (fill in from dashboards)
STRIPE_SECRET_KEY=sk_live_...
STRIPE_PUBLISHABLE_KEY=pk_live_...
STRIPE_WEBHOOK_SECRET=whsec_...

# Storage
PINATA_API_KEY=...
PINATA_SECRET_KEY=...

# Blockchain
POLYGON_RPC_URL=https://polygon-rpc.com
CONTRACT_ADDRESS=0x0E903614e8Fb61B5D36734D7B435088C5d68B963
FUNDER_PRIVATE_KEY=<secure-key>

# Domain
DOMAIN=stampcoin.com
EOF

# 3. التحقق من أن جميع القيم ممتلئة
grep -E '=""$|^#' .env.deploy
```

### GitHub Secrets (للـ CI/CD)

في `https://github.com/Stampcoin-platform/Stampcoin-platform/settings/secrets/actions`:

```
FLY_ACCESS_TOKEN = <من fly.io>
RAILWAY_TOKEN = <من railway.app>
RENDER_API_KEY = <من render.com>
VERCEL_TOKEN = <من vercel.com>
DATABASE_URL_PROD = <قاعدة الإنتاج>
```

---

## 🚀 الخيار 1: Fly.io (الموصى به)

### التثبيت السريع

```bash
# 1. التثبيت والمصادقة
curl -L https://fly.io/install.sh | sh
flyctl auth login
# (سيفتح متصفح، أنشئ حساب أو سجل الدخول)

# 2. التحقق
flyctl version
```

### الإطلاق

```bash
cd /workspaces/Stampcoin-platform

# 1. إنشاء تطبيق
flyctl launch --name stampcoin-platform

# 2. الإعدادات الموصى بها:
# - Region: fra (فرانكفورت - قريب من IONOS)
# - Database: (اختياري - استخدم MySQL مُدار منفصل)
# - Redis: (اختياري - تفعيل للإنتاج)

# 3. تعيين البيئة
flyctl secrets set \
  JWT_SECRET=$(openssl rand -hex 32) \
  SESSION_SECRET=$(openssl rand -hex 32) \
  CEX_USER_ID=162853244 \
  STRIPE_SECRET_KEY=sk_live_... \
  POLYGON_RPC_URL=https://polygon-rpc.com \
  DOMAIN=stampcoin.com

# 4. النشر
flyctl deploy

# 5. المراقبة
flyctl logs -a stampcoin-platform
flyctl status
```

### DNS (إذا استخدمت نطاقك الخاص)

```bash
# احصل على عنوان IP من Fly
flyctl ips list

# في IONOS:
# A Record: stampcoin.com -> <IP من Fly>
# أو CNAME: stampcoin.com -> <Fly CNAME>
```

---

## 🚆 الخيار 2: Railway

### الإعداد السريع

```bash
# 1. التثبيت
npm i -g @railway/cli

# 2. المصادقة
railway login
# (سيطلب توكن من https://railway.app/account/tokens)

# 3. إنشاء مشروع
cd /workspaces/Stampcoin-platform
railway init
# - اسم المشروع: stampcoin
# - هل تريد وضع الملفات الحالية؟ نعم

# 4. إضافة الخدمات
railway add # اختر MySQL و Redis
```

### الإعدادات

```bash
# 1. تعيين متغيرات البيئة
railway variables set \
  JWT_SECRET=$(openssl rand -hex 32) \
  CEX_USER_ID=162853244 \
  STRIPE_SECRET_KEY=sk_live_...

# 2. ربط قاعدة البيانات
# - ستنشئ MySQL تلقائياً
# - انسخ DATABASE_URL من Railway إلى .env.deploy

# 3. النشر
railway up

# 4. عرض URL
railway open
```

---

## 🎨 الخيار 3: Render

### الإطلاق

```bash
# 1. انتقل إلى https://render.com
# 2. انقر على "New +"
# 3. اختر "Web Service"
# 4. أنشئ من GitHub:
#    - Repository: Stampcoin-platform/Stampcoin-platform
#    - Build Command: pnpm install && pnpm build:frontend && pnpm build
#    - Start Command: node dist/index.js
#    - Environment: Node 20
#    - Plan: Free (أو مدفوع للإنتاج)
# 5. أضف Environment Variables من لوحة التحكم
# 6. Deploy!
```

---

## ⚡ الخيار 4: Vercel (واجهة فقط)

```bash
# 1. تثبيت
npm i -g vercel

# 2. المصادقة والنشر
vercel deploy

# 3. اختر:
# - Project Name: stampcoin
# - Framework: Vite
# - Build Command: pnpm build:frontend
# - Output Directory: dist/client

# 4. النتيجة:
# https://stampcoin.vercel.app
```

---

## 🔧 IONOS VPS (للإنتاج الكامل)

### شراء VPS

```
1. انتقل إلى ionos.de
2. ابحث عن VPS
3. اختر: Ubuntu 24.04, 2GB RAM, €2-3/month
4. أنشئ كلمة مرور الجذر قوية
```

### الإعداد الأول

```bash
ssh root@YOUR_VPS_IP

# تحديث النظام
apt update && apt upgrade -y
apt install -y curl wget git docker.io docker-compose nginx certbot python3-certbot-nginx

# إضافة المستخدم
useradd -m -s /bin/bash stampcoin
usermod -aG docker stampcoin
su - stampcoin

# استنساخ المستودع
git clone https://github.com/Stampcoin-platform/Stampcoin-platform.git
cd Stampcoin-platform
```

### التشغيل

```bash
# إنشء .env من الإنتاج
cp .env.deploy.example .env.deploy
nano .env.deploy  # ملء جميع القيم

# بدء الخدمات
docker compose --env-file .env.deploy up -d

# التحقق
docker compose ps
curl http://localhost:3000
```

### SSL + Nginx

```bash
# تكوين Nginx
sudo nano /etc/nginx/sites-available/stampcoin

# (انسخ محتوى من CONFIGURATION_GUIDE.md)

# تفعيل
sudo ln -s /etc/nginx/sites-available/stampcoin \
  /etc/nginx/sites-enabled/

# اختبار وتطبيق
sudo nginx -t
sudo systemctl restart nginx

# SSL من Certbot
sudo certbot certonly --webroot -w /var/www/stampcoin -d stampcoin.com

# تحديث Nginx
sudo nano /etc/nginx/sites-available/stampcoin
# (أضف كتل HTTPS)

sudo systemctl restart nginx
```

---

## 📊 مقارنة النشر

| المعيار | Fly.io | Railway | Render | IONOS VPS |
|--------|--------|---------|--------|-----------|
| التكلفة الأولية | $0 (ائتماني) | $0 | مجاني | €2-3 |
| الإعداد | 5 دقائق | 5 دقائق | 10 دقائق | 30 دقيقة |
| قاعدة البيانات | خارجي | مُضمّن | خارجي | مُضمّن |
| SSL | مجاني | مجاني | مجاني | مجاني (Certbot) |
| السيطرة | متوسطة | متوسطة | منخفضة | عالية |
| الدعم | جيد | ممتاز | جيد | ذاتي |

---

## ✅ قائمة التحقق بعد النشر

- [ ] الخادم يستجيب على المنفذ 3000
- [ ] قاعدة البيانات متصلة
- [ ] OAuth يعمل (Google/Discord)
- [ ] Stripe webhooks مسجلة
- [ ] CEX.io متكامل
- [ ] IPFS يعمل (Pinata)
- [ ] SSL ساري المفعول
- [ ] DNS يشير إلى الخادم
- [ ] اختبار النهاية إلى النهاية (دفع واحد)
- [ ] GitHub Actions يعمل تلقائياً

---

## 🆘 التشخيص السريع

```bash
# التحقق من الملفات
docker compose ps

# عرض السجلات
docker logs stampcoin-app
docker logs stampcoin-mysql

# اختبار الاتصال
curl -X GET http://localhost:3000/api/health

# عرض الأسرار المعينة (Fly.io)
flyctl secrets list

# السجلات (Railway)
railway logs
```

---

**هل تريد متابعة مع الخيار الأول (Fly.io) أم اختيار منصة أخرى؟**
