#!/bin/bash

# 1. الانتقال إلى مجلد المشروع (تأكد من أنك في المسار الصحيح)
# cd path/to/your/stp-repo 

echo "=== بدء عملية مراجعة وتحديث المستودع ==="

# 2. التأكد من وجود المجلدات الأساسية وإنشاؤها إذا لم تكن موجودة
echo "- التحقق من بنية المجلدات..."
mkdir -p .github/workflows
mkdir -p .vscode
mkdir -p docs/architecture
mkdir -p docs/api
mkdir -p src/main/java
mkdir -p src/main/resources
mkdir -p src/test/java

# 3. تحديث ملف .gitignore (لفلترة الملفات غير المرغوبة)
echo "- تحديث ملف .gitignore..."
cat > .gitignore <<EOF
# Compiled class files
*.class

# Log files
*.log

# BlueJ files
*.ctxt

# Mobile Tools for Java (J2ME)
.mtj.tmp/

# Package Files
*.jar
*.war
*.nar
*.ear
*.zip
*.tar.gz
*.rar

# Virtual machine crash logs
hs_err_pid*
replay_pid*

# Maven
target/
pom.xml.tag
pom.xml.releaseBackup
pom.xml.versionsBackup
pom.xml.next
release.properties
dependency-reduced-pom.xml
buildNumber.properties
.mvn/timing.properties
.mvn/wrapper/maven-wrapper.jar

# Gradle
.gradle
build/
!gradle/wrapper/gradle-wrapper.jar
!**/src/main/**/build/
!**/src/test/**/build/

# IntelliJ IDEA
.idea/
*.iws
*.iml
*.ipr
out/
!**/src/main/**/out/
!**/src/test/**/out/

# Eclipse
.apt_generated
.classpath
.factorypath
.project
.settings
.springBeans
.sts4-cache
bin/
!**/src/main/**/bin/
!**/src/test/**/bin/

# NetBeans
/nbproject/private/
/nbbuild/
/dist/
/nbdist/
/.nb-gradle/

# VS Code
.vscode/
!.vscode/settings.json      # <-- استثناء: نريد تتبع إعدادات المحرر
!.vscode/tasks.json
!.vscode/launch.json
!.vscode/extensions.json

# Mac
.DS_Store

# Windows
Thumbs.db

# Logs
logs/
*.log
EOF

# 4. إنشاء/تحديث ملف .vscode/settings.json
echo "- تحديث إعدادات GitLens والمحرر..."
cat > .vscode/settings.json <<EOF
{
    "gitlens.advanced.messages": {
        "suppressShowKeyBindingsNotice": true
    },
    "gitlens.views.repositories.files.layout": "list",
    "git.enableSmartCommit": true,
    "git.autofetch": true,
    "java.configuration.updateBuildConfiguration": "automatic",
    "files.exclude": {
        "**/.git": true,
        "**/.DS_Store": true,
        "**/target": true,
        "**/.classpath": true,
        "**/.project": true,
        "**/.settings": true,
        "**/.factorypath": true
    }
}
EOF

# 5. إنشاء ملف .vscode/extensions.json (لإقتراح الامتدادات المطلوبة)
echo "- إنشاء قائمة الامتدادات المقترحة..."
cat > .vscode/extensions.json <<EOF
{
    "recommendations": [
        "vscjava.vscode-java-pack",
        "eamodio.gitlens",
        "ms-azuretools.vscode-docker",
        "redhat.vscode-xml"
    ]
}
EOF

# 6. تحديث CHANGELOG.md
echo "- تحديث سجل التغييرات..."
cat > CHANGELOG.md <<EOF
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial project structure setup.
- CI/CD pipeline configuration.
- Documentation folder for graphs and architecture.
- Standard .gitignore for Java/Maven/Gradle projects.
- VS Code settings and extensions recommendations.

### Changed
- N/A

### Deprecated
- N/A

### Removed
- N/A

### Fixed
- N/A

### Security
- N/A
EOF

# 7. تحديث README.md
echo "- تحديث ملف README.md..."
cat > README.md <<EOF
# STP Project Repository

This repository contains the source code, documentation, and deployment configurations for the STP project.

## 📂 Structure

- \`src/\`: Source code (Main and Test).
- \`docs/\`: Architecture diagrams and API docs.
- \`.github/workflows/\`: CI/CD pipelines.
- \`CHANGELOG.md\`: History of changes.

## 🚀 Setup

1. Clone the repository.
2. Open in VS Code (recommended extensions will be suggested).
3. Install dependencies (Maven/Gradle).

## 📦 Deployment

Deployment is handled automatically via GitHub Actions upon pushing to the \`main\` branch.
EOF

# 8. تحديث سير العمل (GitHub Actions)
echo "- تحديث ملف سير العمل (CI/CD)..."
cat > .github/workflows/deploy.yml <<EOF
name: CI/CD Pipeline

on:
  push:
    branches: [ "main", "develop" ]
  pull_request:
    branches: [ "main" ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    
    - name: Set up JDK 11
      uses: actions/setup-java@v3
      with:
        java-version: '11'
        distribution: 'temurin'
        cache: maven
        
    - name: Build with Maven
      run: mvn -B package --file pom.xml
      
    - name: Upload Artifact
      uses: actions/upload-artifact@v3
      with:
        name: stp-artifact
        path: target/*.jar

  deploy:
    needs: build
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main' && github.event_name == 'push'
    
    steps:
    - name: Deploy to Production
      run: |
        echo "Deploying to production server..."
        # Add deployment commands here
EOF

# 9. إنشاء ملف pom.xml افتراضي (إذا لم يكن موجوداً لمنع حدوث خطأ في الـ Build)
if [ ! -f "pom.xml" ]; then
  echo "- إنشاء ملف pom.xml افتراضي..."
  cat > pom.xml <<EOF
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.example</groupId>
    <artifactId>stp-project</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>jar</packaging>

    <name>STP Project</name>
    <url>http://maven.apache.org</url>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <maven.compiler.source>11</maven.compiler.source>
        <maven.compiler.target>11</maven.compiler.target>
    </properties>

    <dependencies>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.13.2</version>
            <scope>test</scope>
        </dependency>
    </dependencies>
</project>
EOF
fi

# 10. إضافة جميع الملفات إلى Git (Add)
echo "- جاري إضافة جميع الملفات المحدثة إلى Git..."
git add .

# 11. حفظ التغييرات (Commit)
echo "- جاري حفظ التغييرات (Commit)..."
git commit -m "chore: تحديث البنية الكاملة للمستودع وإضافة الملفات الناقصة (GitLens, CI/CD, Docs)"

# 12. الرفع (Push) - (اختياري، قم بإلغاء التعليق إذا كنت تريد الرفع فوراً)
# git push origin main

echo "=== تم الانتهاء! المستودع الآن محدث ومنظم بالكامل ==="
