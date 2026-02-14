# شرح ملف env.sh في GitHub Runner

## مقدمة
ملف env.sh هو جزء من حزمة GitHub Runner المسؤولة عن إعداد متغيرات البيئة اللازمة لتشغيل العداد بشكل صحيح. هذا الملف يضمن أن جميع المتغيرات الضرورية متاحة للعمليات التي يقوم بها العداد.

## كيف يعمل ملف env.sh

### 1. قائمة المتغيرات التي يتحقق منها
الملف يحتوي على قائمة بالمتغيرات التي يتحقق من وجودها:
- LANG: لغة النظام
- JAVA_HOME: مسار تثبيت Java
- ANT_HOME: مسار تثبيت Apache Ant
- M2_HOME: مسار تثبيت Maven
- ANDROID_HOME: مسار تثبيت Android SDK
- ANDROID_SDK_ROOT: جذر Android SDK
- GRADLE_HOME: مسار تثبيت Gradle
- NVM_BIN: مسار NVM bin
- NVM_PATH: مسار NVM
- LD_LIBRARY_PATH: مسار المكتبات المشتركة
- PERL5LIB: مسار مكتبات Perl

### 2. إنشاء ملف .env
الملف يقوم بإنشاء ملف .env إذا لم يكن موجودًا بالفعل. هذا الملف يحتوي على قائمة بالمتغيرات البيئية.

### 3. حفظ متغيرات البيئة
الملف يتحقق من كل متغير في القائمة:
- إذا كان المتغير موجودًا في النظام، يتم حفظه في ملف .env
- إذا لم يكن موجودًا، يتم تجاهله

### 4. حفظ مسار النظام (PATH)
يتم حفظ متغير PATH الحالي في ملف .path للاستخدام لاحقًا.

## كيفية استخدام ملف env.sh

### 1. نسخ الملف إلى مجلد العداد
```bash
cp env.sh /path/to/actions-runner/
```

### 2. تشغيل الملف قبل إعداد العداد
```bash
cd /path/to/actions-runner
source ./env.sh
```

### 3. تشغيل config.sh
بعد تشغيل env.sh، يمكنك تشغيل config.sh:
```bash
./config.sh --url https://github.com/zedanazad43/stp --token YOUR_TOKEN
```

## أهمية متغيرات البيئة

### متغيرات أساسية
- **LANG**: يحدد لغة النظام، مهمة لعرض رسائل الخطأ باللغة المناسبة
- **LD_LIBRARY_PATH**: يحتوي على مسارات المكتبات المشتركة، ضروري لتشغيل التطبيقات

### متغيرات تطوير البرمجيات
- **JAVA_HOME**: مسار تثبيت Java، ضروري لتشغيل Java applications
- **M2_HOME**: مسار Maven، مستخدم في مشاريع Java
- **GRADLE_HOME**: مسار Gradle، مستخدم في مشاريع Android وJava

### متغيرات تطوير تطبيقات الجوال
- **ANDROID_HOME**: مسار Android SDK، ضروري لتطوير تطبيقات Android
- **ANDROID_SDK_ROOT**: جذر Android SDK، يستخدم في بعض أدوات التطوير

## نصائح إضافية

### 1. تعيين متغيرات بيئة إضافية
إذا كنت بحاجة إلى متغيرات إضافية، يمكنك إضافتها إلى ملف .env:
```bash
export NEW_VAR=value
```

### 2. تعديل قائمة المتغيرات
يمكنك تعديل قائمة المتغيرات في env.sh عن طريق تعديل مصفوفة varCheckList:
```bash
varCheckList=(
    'LANG'
    'JAVA_HOME'
    # ... إضافة المزيد من المتغيرات
    'NEW_VAR'  # متغير جديد
)
```

### 3. التحقق من متغيرات البيئة
بعد تشغيل env.sh، يمكنك التحقق من المتغيرات التي تم حفظها:
```bash
cat .env
```

## مثال على ملف .env بعد التشغيل
```
LANG=en_US.UTF-8
JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
M2_HOME=/usr/share/maven
GRADLE_HOME=/opt/gradle
LD_LIBRARY_PATH=/usr/local/lib
```
