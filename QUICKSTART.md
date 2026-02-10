# Quick Start Guide - دليل البدء السريع
# Market Institution (مؤسسة السوق)

## الإطلاق السريع / Quick Start

### 1. Clone and Install / الاستنساخ والتثبيت

```bash
git clone https://github.com/zedanazad43/stp.git
cd stp
npm install
```

### 2. Run the Server / تشغيل الخادم

```bash
npm start
```

Server will start on http://localhost:8080

### 3. Test the Market API / اختبار واجهة برمجة السوق

```bash
# List all market items / عرض جميع عناصر السوق
curl http://localhost:8080/api/market/items

# Add a new item to market / إضافة عنصر جديد للسوق
curl -X POST http://localhost:8080/api/market/items \
  -H "Content-Type: application/json" \
  -d '{
    "sellerId": "seller123",
    "item": {
      "name": "Rare Vintage Stamp",
      "description": "1950s collectible stamp",
      "price": 100,
      "type": "stamp"
    }
  }'

# Purchase an item / شراء عنصر
curl -X POST http://localhost:8080/api/market/items/ITEM_ID/purchase \
  -H "Content-Type: application/json" \
  -d '{"buyerId": "buyer123"}'
```

## Docker Quick Start / البدء السريع مع Docker

```bash
# Build Docker image / بناء صورة Docker
npm run docker:build

# Run Docker container / تشغيل حاوية Docker
npm run docker:run

# Test the API / اختبار الواجهة
curl http://localhost:8080/api/market/items
```

## Core Features / الميزات الأساسية

### Market Operations / عمليات السوق

1. **Add Item** - List items for sale / إدراج عناصر للبيع
2. **Browse Items** - View all available items / عرض جميع العناصر المتاحة
3. **Purchase** - Buy items from the market / شراء عناصر من السوق
4. **Update Item** - Modify item details / تعديل تفاصيل العنصر
5. **Remove Item** - Remove your listings / إزالة قوائمك
6. **Transaction History** - View purchase history / عرض سجل الشراء

### Wallet Integration / تكامل المحفظة

```bash
# Create a wallet / إنشاء محفظة
curl -X POST http://localhost:8080/api/wallets \
  -H "Content-Type: application/json" \
  -d '{"userId": "user123", "userName": "John Doe"}'

# Check wallet balance / فحص رصيد المحفظة
curl http://localhost:8080/api/wallets/user123

# Add balance to wallet / إضافة رصيد للمحفظة
curl -X POST http://localhost:8080/api/wallets/user123/balance \
  -H "Content-Type: application/json" \
  -d '{"amount": 500}'
```

## API Documentation / توثيق الواجهة

For complete API documentation, see:
- [MARKET_API.md](MARKET_API.md) - Market Institution API
- [WALLET_API.md](WALLET_API.md) - Digital Wallet API
- [DEPLOYMENT.md](DEPLOYMENT.md) - Deployment Guide

## Project Structure / هيكل المشروع

```
stp/
├── server.js           # Main server file / ملف الخادم الرئيسي
├── market.js           # Market module / وحدة السوق
├── wallet.js           # Wallet module / وحدة المحفظة
├── package.json        # Dependencies / التبعيات
├── Dockerfile          # Docker configuration / إعداد Docker
├── MARKET_API.md       # Market API docs / توثيق واجهة السوق
├── WALLET_API.md       # Wallet API docs / توثيق واجهة المحفظة
├── DEPLOYMENT.md       # Deployment guide / دليل النشر
└── README.md           # Project overview / نظرة عامة
```

## Environment Variables / متغيرات البيئة

```env
# Optional: Port number (default: 8080)
PORT=8080

# Optional: Authentication token for sync endpoints
SYNC_TOKEN=your_secure_token
```

## Available Scripts / البرامج النصية المتاحة

```bash
npm start              # Start the server / تشغيل الخادم
npm run dev            # Development mode / وضع التطوير
npm run build          # Build for production / البناء للإنتاج
npm test               # Run tests / تشغيل الاختبارات
npm run docker:build   # Build Docker image / بناء صورة Docker
npm run docker:run     # Run in Docker / التشغيل في Docker
```

## Deployment Options / خيارات النشر

### 1. Local Development / التطوير المحلي
```bash
npm install
npm start
```

### 2. Docker / دوكر
```bash
docker build -t stampcoin-platform .
docker run -p 8080:8080 stampcoin-platform
```

### 3. Cloud Platforms / المنصات السحابية
- Railway.app
- Fly.io
- Render.com
- Heroku
- AWS/Azure/GCP

See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed instructions.

## Testing Checklist / قائمة الاختبار

- [ ] Server starts successfully
- [ ] Market API endpoints respond
- [ ] Wallet API endpoints respond
- [ ] Can add items to market
- [ ] Can purchase items
- [ ] Can view transaction history
- [ ] Docker build succeeds
- [ ] Docker container runs

## Troubleshooting / استكشاف الأخطاء

### Server won't start / لن يبدأ الخادم
```bash
# Check if port 8080 is in use
lsof -ti:8080

# Kill process if needed
lsof -ti:8080 | xargs kill
```

### Module not found / الوحدة غير موجودة
```bash
# Reinstall dependencies
rm -rf node_modules package-lock.json
npm install
```

### Docker issues / مشاكل Docker
```bash
# Clean Docker cache
docker system prune -a

# Rebuild without cache
docker build --no-cache -t stampcoin-platform .
```

## Next Steps / الخطوات التالية

1. ✅ Basic setup complete
2. 🔄 Explore the API endpoints
3. 📚 Read full documentation
4. 🚀 Deploy to production
5. 🔒 Configure security settings
6. 📊 Set up monitoring

## Support / الدعم

- 📖 Documentation: [README.md](README.md)
- 🔧 Issues: GitHub Issues
- 💬 Discussions: GitHub Discussions

---

**Ready to Go! / جاهز للانطلاق!** 🚀

Start exploring the Market Institution API and build amazing digital marketplace applications!

ابدأ في استكشاف واجهة برمجة تطبيقات مؤسسة السوق وبناء تطبيقات سوق رقمية مذهلة!
