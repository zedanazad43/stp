#!/bin/bash
# Digital Wallet API Example Usage
# مثال على استخدام واجهة برمجة تطبيقات المحفظة الرقمية

echo "=== Stampcoin Digital Wallet Demo ==="
echo "=== عرض توضيحي للمحفظة الرقمية لـ Stampcoin ==="
echo ""

BASE_URL="http://localhost:8080/api"

# Step 1: Create wallets | الخطوة 1: إنشاء المحافظ
echo "1. Creating wallets | إنشاء المحافظ..."
curl -X POST $BASE_URL/wallets \
  -H "Content-Type: application/json" \
  -d '{"userId": "user001", "userName": "محمد أحمد"}' | jq .
echo ""

curl -X POST $BASE_URL/wallets \
  -H "Content-Type: application/json" \
  -d '{"userId": "user002", "userName": "فاطمة علي"}' | jq .
echo ""

# Step 2: Add balance | الخطوة 2: إضافة رصيد
echo "2. Adding balance | إضافة رصيد..."
curl -X POST $BASE_URL/wallets/user001/balance \
  -H "Content-Type: application/json" \
  -d '{"amount": 1000}' | jq .
echo ""

curl -X POST $BASE_URL/wallets/user002/balance \
  -H "Content-Type: application/json" \
  -d '{"amount": 500}' | jq .
echo ""

# Step 3: Add stamps | الخطوة 3: إضافة الطوابع
echo "3. Adding digital stamps | إضافة الطوابع الرقمية..."
curl -X POST $BASE_URL/wallets/user001/stamps \
  -H "Content-Type: application/json" \
  -d '{
    "name": "طابع تذكاري 2024",
    "value": 150,
    "rarity": "نادر",
    "description": "طابع تذكاري للألعاب الأولمبية"
  }' | jq .
echo ""

curl -X POST $BASE_URL/wallets/user001/stamps \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Vintage Classic 1960",
    "value": 200,
    "rarity": "legendary",
    "description": "Rare vintage stamp from 1960"
  }' | jq .
echo ""

# Step 4: View wallets | الخطوة 4: عرض المحافظ
echo "4. Viewing all wallets | عرض جميع المحافظ..."
curl -s $BASE_URL/wallets | jq .
echo ""

# Step 5: Transfer balance | الخطوة 5: تحويل الرصيد
echo "5. Transferring 100 credits from user001 to user002..."
echo "   تحويل 100 رصيد من user001 إلى user002..."
curl -X POST $BASE_URL/wallets/transfer \
  -H "Content-Type: application/json" \
  -d '{"fromUserId": "user001", "toUserId": "user002", "amount": 100}' | jq .
echo ""

# Step 6: View transaction history | الخطوة 6: عرض سجل المعاملات
echo "6. Viewing transaction history | عرض سجل المعاملات..."
curl -s $BASE_URL/transactions | jq .
echo ""

# Step 7: Final wallet states | الخطوة 7: الحالة النهائية للمحافظ
echo "7. Final wallet states | الحالة النهائية للمحافظ:"
echo ""
echo "User 001 wallet:"
curl -s $BASE_URL/wallets/user001 | jq .
echo ""
echo "User 002 wallet:"
curl -s $BASE_URL/wallets/user002 | jq .
echo ""

echo "=== Demo Complete | العرض التوضيحي مكتمل ==="
