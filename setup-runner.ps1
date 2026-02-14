
# GitHub Actions Runner 设置脚本

Write-Host "GitHub Actions Runner 设置脚本" -ForegroundColor Green
Write-Host "=================================" -ForegroundColor Green

# 设置变量
$repoUrl = "https://github.com/your-username/your-repo"  # 替换为您的仓库URL
$runnerToken = "your_runner_token"  # 替换为您的 runner token

# 移动到 actions-runner 目录
Write-Host "切换到 actions-runner 目录..." -ForegroundColor Yellow
Set-Location -Path "C:\Users\azadz\actions-runner"

# 解压下载的文件
Write-Host "解压 GitHub Actions Runner..." -ForegroundColor Yellow
tar -xzf actions-runner-linux-x64-2.331.0.tar.gz

# 配置 runner
Write-Host "配置 GitHub Actions Runner..." -ForegroundColor Yellow
.\config.cmd --url $repoUrl --token $runnerToken

# 安装并启动 runner
Write-Host "安装并启动 GitHub Actions Runner..." -ForegroundColor Yellow
.un.cmd --once

Write-Host "设置完成！Runner 现在应该可以连接到您的仓库了。" -ForegroundColor Green
