# التثبيت / Installation / Installation

## العربية 🇸🇦
1. تأكد من وجود Python (>= 3.9) وNode.js (>= 16.x)
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
1. Ensure Python (>= 3.9) & Node.js (>= 16.x) are installed.
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
1. Sorge dafür, dass Python (>= 3.9) & Node.js (>= 16.x) installiert sind.
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
