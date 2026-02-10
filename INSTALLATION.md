# التثبيت / Installation / Installation

## العربية 🇸🇦

### متطلبات النظام
- Python >= 3.8 (يُوصى بـ 3.14.3)
- Node.js >= 16.x
- Git

### التثبيت على Windows
1. افتح PowerShell كمسؤول (Run as Administrator)
2. نفّذ سكربت الإعداد التلقائي:
   ```powershell
   .\setup-windows.ps1
   ```
   هذا السكربت سيقوم بتثبيت:
   - Chocolatey (مدير الحزم)
   - Python 3.14.3
   - Node.js LTS
   - Visual Studio 2022 Build Tools
   - Git

3. أو قم بالتثبيت اليدوي باستخدام Chocolatey:
   ```powershell
   # تثبيت Chocolatey أولاً من https://chocolatey.org/install
   choco install python --version=3.14.3 -y
   choco install nodejs-lts -y
   choco install git -y
   choco install visualstudio2022-workload-vctools -y
   ```

4. استنسخ المشروع:
   ```
   git clone https://github.com/zedanazad43/stp.git
   cd stp
   ```

5. ثبّت المتطلبات:
   ```
   npm install
   pip install -r requirements.txt
   ```

### التثبيت على Linux/macOS
1. تأكد من وجود Python وNode.js
2. استنسخ المشروع:
   ```
   git clone https://github.com/zedanazad43/stp.git
   cd stp
   ```
3. ثبّت المتطلبات:
   ```
   npm install
   pip install -r requirements.txt
   ```

## English 🇬🇧

### System Requirements
- Python >= 3.8 (3.14.3 recommended)
- Node.js >= 16.x
- Git

### Windows Installation
1. Open PowerShell as Administrator
2. Run the automated setup script:
   ```powershell
   .\setup-windows.ps1
   ```
   This script will install:
   - Chocolatey (package manager)
   - Python 3.14.3
   - Node.js LTS
   - Visual Studio 2022 Build Tools
   - Git

3. Or install manually using Chocolatey:
   ```powershell
   # First install Chocolatey from https://chocolatey.org/install
   choco install python --version=3.14.3 -y
   choco install nodejs-lts -y
   choco install git -y
   choco install visualstudio2022-workload-vctools -y
   ```

4. Clone the repository:
   ```
   git clone https://github.com/zedanazad43/stp.git
   cd stp
   ```

5. Install dependencies:
   ```
   npm install
   pip install -r requirements.txt
   ```

### Linux/macOS Installation
1. Ensure Python & Node.js are installed.
2. Clone:
   ```
   git clone https://github.com/zedanazad43/stp.git
   cd stp
   ```
3. Install:
   ```
   npm install
   pip install -r requirements.txt
   ```

## Deutsch 🇩🇪

### Systemanforderungen
- Python >= 3.8 (3.14.3 empfohlen)
- Node.js >= 16.x
- Git

### Windows-Installation
1. Öffne PowerShell als Administrator
2. Führe das automatische Setup-Skript aus:
   ```powershell
   .\setup-windows.ps1
   ```
   Dieses Skript installiert:
   - Chocolatey (Paketmanager)
   - Python 3.14.3
   - Node.js LTS
   - Visual Studio 2022 Build Tools
   - Git

3. Oder installiere manuell mit Chocolatey:
   ```powershell
   # Zuerst Chocolatey installieren von https://chocolatey.org/install
   choco install python --version=3.14.3 -y
   choco install nodejs-lts -y
   choco install git -y
   choco install visualstudio2022-workload-vctools -y
   ```

4. Repository klonen:
   ```
   git clone https://github.com/zedanazad43/stp.git
   cd stp
   ```

5. Abhängigkeiten installieren:
   ```
   npm install
   pip install -r requirements.txt
   ```

### Linux/macOS-Installation
1. Sorge dafür, dass Python & Node.js installiert sind.
2. Klonen:
   ```
   git clone https://github.com/zedanazad43/stp.git
   cd stp
   ```
3. Installieren:
   ```
   npm install
   pip install -r requirements.txt
   ```

## Troubleshooting / استكشاف الأخطاء / Fehlerbehebung

### Windows
- **Chocolatey already installed warning**: If you see a warning about existing Chocolatey installation, use `choco upgrade chocolatey` to upgrade it first
- **Python version mismatch**: Run `choco upgrade python --version=3.14.3 -y` to upgrade to the correct version
- **Environment variables not updated**: Close and reopen your terminal after installation
- **Visual Studio Build Tools**: Required for some Python packages with C++ dependencies

### All Platforms
- **npm install fails**: Try deleting `node_modules` and `package-lock.json`, then run `npm install` again
- **pip install fails**: Try upgrading pip: `python -m pip install --upgrade pip`
- **Git not found**: Ensure Git is installed and added to your system PATH
