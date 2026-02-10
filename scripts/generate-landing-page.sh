#!/bin/bash
# Script to generate a professional landing page for Stampcoin Platform

set -e

OUTPUT_DIR="${1:-public}"
mkdir -p "$OUTPUT_DIR"

# Only generate if index.html doesn't exist
if [ -f "$OUTPUT_DIR/index.html" ]; then
    echo "Landing page already exists at $OUTPUT_DIR/index.html"
    exit 0
fi

echo "Generating landing page at $OUTPUT_DIR/index.html"

cat > "$OUTPUT_DIR/index.html" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Stampcoin - Blockchain-based digital stamps and loyalty tokens platform">
    <title>Stampcoin Platform - Digital Stamps & Blockchain</title>
    <style>
        :root {
            --violet: #7c3aed;
            --blue: #2563eb;
            --cyan: #06b6d4;
            --slate: #1e293b;
            --light: #f1f5f9;
            --gray: #64748b;
        }
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to bottom right, var(--violet), var(--blue));
            min-height: 100vh;
            padding: 20px;
            color: var(--slate);
        }
        
        .wrapper {
            max-width: 1400px;
            margin: 0 auto;
        }
        
        .hero {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            padding: 60px 40px;
            margin-bottom: 30px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            text-align: center;
        }
        
        .logo-title {
            font-size: 3rem;
            font-weight: 700;
            background: linear-gradient(135deg, var(--violet), var(--cyan));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 20px;
        }
        
        .tagline {
            font-size: 1.4rem;
            color: var(--gray);
            margin-bottom: 15px;
        }
        
        .intro {
            font-size: 1.1rem;
            line-height: 1.8;
            color: #475569;
            max-width: 800px;
            margin: 15px auto;
        }
        
        .main-content {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        }
        
        .heading {
            font-size: 2rem;
            color: var(--violet);
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 12px;
        }
        
        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 24px;
            margin: 30px 0;
        }
        
        .feature-item {
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            padding: 24px;
            border-radius: 12px;
            border-left: 5px solid var(--violet);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .feature-item:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 24px rgba(124, 58, 237, 0.2);
        }
        
        .feature-heading {
            font-size: 1.3rem;
            color: var(--violet);
            margin-bottom: 12px;
            font-weight: 600;
        }
        
        .feature-text {
            color: #475569;
            line-height: 1.6;
            margin-bottom: 8px;
        }
        
        .api-container {
            background: var(--slate);
            color: var(--light);
            padding: 32px;
            border-radius: 12px;
            margin: 30px 0;
        }
        
        .api-heading {
            color: var(--cyan);
            font-size: 1.8rem;
            margin-bottom: 24px;
        }
        
        .api-method {
            margin-bottom: 28px;
        }
        
        .method-label {
            color: var(--cyan);
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 1.1rem;
        }
        
        .code-block {
            background: #0f172a;
            padding: 16px;
            border-radius: 8px;
            overflow-x: auto;
            font-family: 'Courier New', monospace;
            font-size: 0.9rem;
            line-height: 1.5;
            border: 1px solid #334155;
        }
        
        .button-row {
            display: flex;
            flex-wrap: wrap;
            gap: 16px;
            margin-top: 36px;
        }
        
        .nav-button {
            background: linear-gradient(135deg, var(--violet), var(--blue));
            color: white;
            padding: 14px 28px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(124, 58, 237, 0.3);
        }
        
        .nav-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(124, 58, 237, 0.5);
        }
        
        @media (max-width: 768px) {
            .logo-title {
                font-size: 2rem;
            }
            
            .hero,
            .main-content {
                padding: 30px 20px;
            }
            
            .feature-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <section class="hero">
            <h1 class="logo-title">🎫 Stampcoin Platform</h1>
            <p class="tagline">
                منصة رقمية مبتكرة للطوابع | 
                Innovative Digital Stamps Platform | 
                Innovative digitale Briefmarkenplattform
            </p>
            <p class="intro">
                A cutting-edge blockchain platform revolutionizing digital stamps, 
                loyalty rewards, and collectible tokens with secure transactions and user verification.
            </p>
            <p class="intro" dir="rtl" lang="ar">
                منصة متطورة تعتمد على تقنية البلوكتشين لإدارة الطوابع الرقمية ومكافآت الولاء والرموز القابلة للتحصيل
            </p>
        </section>

        <section class="main-content">
            <h2 class="heading">✨ Key Features</h2>
            
            <div class="feature-grid">
                <div class="feature-item">
                    <h3 class="feature-heading">💼 Digital Wallet System</h3>
                    <p class="feature-text">محفظة رقمية متقدمة</p>
                    <p class="feature-text">
                        Advanced secure storage solution for managing your digital stamp collection
                    </p>
                </div>
                
                <div class="feature-item">
                    <h3 class="feature-heading">🔒 Encrypted Transactions</h3>
                    <p class="feature-text">معاملات مشفرة وآمنة</p>
                    <p class="feature-text">
                        Direct peer-to-peer transfers with end-to-end encryption
                    </p>
                </div>
                
                <div class="feature-item">
                    <h3 class="feature-heading">🏪 Trading Marketplace</h3>
                    <p class="feature-text">سوق للتداول الرقمي</p>
                    <p class="feature-text">
                        Exchange stamps, collectibles, and digital assets securely
                    </p>
                </div>
                
                <div class="feature-item">
                    <h3 class="feature-heading">🔐 User Verification</h3>
                    <p class="feature-text">نظام التحقق الموثوق</p>
                    <p class="feature-text">
                        Comprehensive authentication and profile management system
                    </p>
                </div>
            </div>

            <div class="api-container">
                <h2 class="api-heading">🔌 REST API Documentation</h2>
                
                <div class="api-method">
                    <div class="method-label">GET /sync - Fetch user data</div>
                    <pre class="code-block">curl -H "Authorization: Bearer YOUR_API_TOKEN" \
     https://api.example.com/sync</pre>
                </div>
                
                <div class="api-method">
                    <div class="method-label">POST /sync - Synchronize user data</div>
                    <pre class="code-block">curl -X POST \
     -H "Authorization: Bearer YOUR_API_TOKEN" \
     -H "Content-Type: application/json" \
     -d '{"todos": [...], "stamps": [...]}' \
     https://api.example.com/sync</pre>
                </div>
            </div>

            <div class="button-row">
                <a href="https://github.com/zedanazad43/stp" class="nav-button">
                    📂 View Source Code
                </a>
                <a href="https://github.com/zedanazad43/stp/blob/main/README.md" class="nav-button">
                    📖 Read Documentation
                </a>
                <a href="https://github.com/zedanazad43/stp/blob/main/INSTALLATION.md" class="nav-button">
                    ⚙️ Setup Guide
                </a>
            </div>
        </section>
    </div>
</body>
</html>
EOF

echo "Landing page generated successfully!"
