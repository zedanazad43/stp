# Option 3: Complete Deployment Guide
## Website + API + Custom Domain (stampcoin.com)

**Status:** Ready for Production Deployment  
**Domain:** stampcoin.com  
**Website Hosting:** GitHub Pages  
**API Backend:** Render.com  
**Last Updated:** 2024

---

## Table of Contents

1. [Architecture Overview](#architecture-overview)
2. [Part 1: Enable GitHub Pages](#part-1-enable-github-pages)
3. [Part 2: Deploy API to Render.com](#part-2-deploy-api-to-rendercom)
4. [Part 3: Domain Registration & Selection](#part-3-domain-registration--selection)
5. [Part 4: DNS Configuration](#part-4-dns-configuration)
6. [Part 5: Final Integration & Testing](#part-5-final-integration--testing)
7. [Troubleshooting](#troubleshooting)
8. [Post-Deployment Checklist](#post-deployment-checklist)

---

## Architecture Overview

Your deployment consists of three components:

**Frontend (Static Website)**
- Hosted on GitHub Pages
- Files: `index.html`, `public/`, documentation
- Custom domain: stampcoin.com
- HTTPS: Automatic

**Backend API (Node.js/Express)**
- Hosted on Render.com
- Processes sync requests from the frontend
- Environment: Production with auto-deploy from GitHub
- Database: File-based or PostgreSQL (configurable)

**Custom Domain**
- DNS points stampcoin.com to GitHub Pages
- API runs on api.stampcoin.com (subdomain)
- CNAME records handle routing

```
User Browser
    ↓
stampcoin.com (GitHub Pages - Static Content)
    ↓
JavaScript makes API calls
    ↓
api.stampcoin.com (Render.com - Express Backend)
    ↓
Data Processing & Storage
```

---

## Part 1: Enable GitHub Pages

GitHub Pages is already configured in your repository. Follow these steps to activate it:

### Step 1.1: Access Repository Settings

1. Go to your GitHub repository: `https://github.com/zedanazad43/stp`
2. Click **Settings** (top menu)
3. Click **Pages** (left sidebar, under "Code and automation")

### Step 1.2: Configure GitHub Pages

1. Under "Source", select **Deploy from a branch**
2. Choose branch: **main**
3. Choose folder: **/ (root)**
4. Click **Save**

The workflow will start automatically. This takes 1-2 minutes.

### Step 1.3: Verify GitHub Pages Build

1. Go to **Actions** tab in your repository
2. Look for "Deploy to GitHub Pages" workflow
3. Wait for green checkmark (✓)
4. Your site will be available at: `https://zedanazad43.github.io/stp`

### Step 1.4: Confirm Files Are Ready

The GitHub Pages workflow (`pages.yml`) copies these files:
- `index.html` - Main website
- `README.md` - Documentation
- `INSTALLATION.md` - Setup guide
- `SECURITY.md` - Security information
- `CONTRIBUTING.md` - Contribution guide
- `docs/` directory - Additional documentation

All these files are already in your repository.

**Status Check:**
```
✓ pages.yml workflow configured
✓ index.html exists
✓ public/ directory ready
✓ CNAME file contains: stampcoin.com
```

---

## Part 2: Deploy API to Render.com

Your Express API needs to run on a backend service. Render.com provides free and paid options.

### Step 2.1: Create Render Account

1. Go to https://render.com
2. Click **Sign up**
3. Choose: "Sign up with GitHub" (recommended)
4. Authorize Render to access your GitHub account
5. Complete onboarding

### Step 2.2: Deploy Web Service

1. In Render dashboard, click **New +**
2. Select **Web Service**
3. Connect your GitHub repository:
   - Search: `stp` (or full name: `zedanazad43/stp`)
   - Click **Connect**

### Step 2.3: Configure Web Service

Fill in these settings:

| Field | Value |
|-------|-------|
| Name | `stampcoin-api` |
| Environment | `Node` |
| Build Command | `npm install` |
| Start Command | `npm start` |
| Plan | Free (for testing) or Starter Pro ($7/month) |
| Region | US (closest to your users) |

**Important Settings:**

1. **Environment Variables:**
   - Click **Environment**
   - Add these variables:
     ```
     PORT=8080
     SYNC_TOKEN=your-secure-token-here
     NODE_ENV=production
     ```
   - Click **Save changes**

2. **Auto-Deploy:**
   - Enable: "Auto-deploy new commits to main"
   - Your API updates automatically when you push to GitHub

### Step 2.4: Wait for Deployment

1. Render builds and deploys your service (takes 2-5 minutes)
2. Look for "Your service is live" message
3. Your API will be at: `https://stampcoin-api.onrender.com`

**Note:** Render free tier services go to sleep after 15 minutes of inactivity. Upgrade to Starter Pro ($7/month) for production.

### Step 2.5: Test API Health

```bash
# Test the sync endpoint
curl -X GET https://stampcoin-api.onrender.com/sync

# Expected response:
# {"todos":[]}
```

---

## Part 3: Domain Registration & Selection

### Step 3.1: Choose a Domain Registrar

**Recommended Options:**

| Registrar | Price/Year | Pros | Cons |
|-----------|-----------|------|------|
| **Namecheap** | $8.88 | Affordable, good support, DNS simple | Limited free SSL |
| **Google Domains** | $12 | Excellent UX, easy setup, Google integration | Higher price |
| **GoDaddy** | $7.99* | Competitive, many features | Upsell-heavy interface |
| **Cloudflare** | $8.99 | DNS + CDN included, very fast | Requires technical knowledge |

**Recommendation:** Use **Namecheap** or **Google Domains** for simplicity.

### Step 3.2: Purchase stampcoin.com

#### Via Namecheap:

1. Go to https://www.namecheap.com
2. Search for `stampcoin.com`
3. Add to cart
4. Checkout and complete payment
5. Receive domain in your account

#### Via Google Domains:

1. Go to https://domains.google
2. Search for `stampcoin.com`
3. Follow checkout
4. Domain transfers to your Google account

### Step 3.3: Access Domain Settings

After purchase, you need to configure DNS records.

**Namecheap:**
- Go to dashboard → "Manage" button next to domain
- Click "Advanced DNS" tab

**Google Domains:**
- Go to dashboard → your domain
- Click "DNS" in left menu

**Keep this page open** for Step 4 (DNS Configuration).

---

## Part 4: DNS Configuration

DNS (Domain Name System) routes traffic from stampcoin.com to the right servers.

### Step 4.1: Configure GitHub Pages DNS

Add these records to your domain registrar:

**For GitHub Pages (Website):**

| Type | Host | Value | TTL |
|------|------|-------|-----|
| A | @ | 185.199.108.153 | 3600 |
| A | @ | 185.199.109.153 | 3600 |
| A | @ | 185.199.110.153 | 3600 |
| A | @ | 185.199.111.153 | 3600 |

These IP addresses point your domain root (@) to GitHub's servers.

**Instructions for Namecheap:**

1. Log in to Namecheap
2. Find your domain and click "Manage"
3. Go to "Advanced DNS" tab
4. Find "A Record" section
5. Click "Add new record"
6. Select Type: **A Record**
7. Host: **@**
8. Value: **185.199.108.153** (first IP)
9. TTL: **3600**
10. Click checkmark (✓)
11. Repeat steps 5-10 for each IP address (4 total)

**Instructions for Google Domains:**

1. Go to your domain settings
2. Click "DNS" 
3. Scroll to "Custom Records"
4. For each IP, add:
   - Record Type: A
   - Host: @ (leave empty)
   - IPv4: paste the IP
   - Save

### Step 4.2: Configure API Subdomain

Add CNAME record for API backend:

| Type | Host | Value | TTL |
|------|------|-------|-----|
| CNAME | api | stampcoin-api.onrender.com | 3600 |

**Instructions for Namecheap:**

1. In Advanced DNS tab
2. Find CNAME Record section
3. Click "Add new record"
4. Type: **CNAME Record**
5. Host: **api**
6. Value: **stampcoin-api.onrender.com**
7. TTL: **3600**
8. Click checkmark (✓)

**Instructions for Google Domains:**

1. In Custom Records section
2. Type: **CNAME**
3. Host: **api**
4. Value: **stampcoin-api.onrender.com**
5. Save

### Step 4.3: Verify DNS Propagation

DNS changes take 15 minutes to 24 hours to propagate globally. Check status:

```bash
# Check A records (website)
nslookup stampcoin.com

# Check CNAME record (API)
nslookup api.stampcoin.com

# Expected output for A record:
# Address: 185.199.108.153 (or similar)

# Expected output for CNAME:
# stampcoin-api.onrender.com
```

Or use online tools:
- https://mxtoolbox.com/nslookup.aspx
- https://whatsmydns.net

### Step 4.4: Configure HTTPS (SSL/TLS)

GitHub Pages automatically provides HTTPS for your domain.

**Render.com:**

1. Go to your Render service dashboard
2. Click **Settings**
3. Under "Custom Domain", add: `api.stampcoin.com`
4. Render automatically provisions SSL certificate (free)

---

## Part 5: Final Integration & Testing

### Step 5.1: Update Frontend to Use Custom Domain

Edit your frontend code to point to the new API:

**File: `index.html`**

Find all API calls and update URLs:

```javascript
// OLD (GitHub Pages default):
fetch('https://stampcoin-api.onrender.com/sync')

// NEW (Custom domain):
fetch('https://api.stampcoin.com/sync')
```

Search for and replace these patterns in your code:
- `stampcoin-api.onrender.com` → `api.stampcoin.com`

**Commit and push to GitHub:**

```bash
git add index.html
git commit -m "Update API endpoint to custom domain"
git push origin main
```

GitHub Pages redeploys automatically (1-2 minutes).

### Step 5.2: Test Website Access

**Via Custom Domain:**

1. Open browser
2. Go to `https://stampcoin.com`
3. Should load your website
4. Check browser console for errors (F12 → Console tab)

**Expected behavior:**
- Page loads
- No SSL warnings
- No CORS errors

### Step 5.3: Test API Endpoint

**Direct API test:**

```bash
# Test via custom domain API
curl -X GET https://api.stampcoin.com/sync

# Response should be:
# {"todos":[]}
```

**From your frontend:**

1. Open `https://stampcoin.com`
2. Open DevTools (F12)
3. Go to Network tab
4. Trigger an action that calls `/sync`
5. Check request succeeds (Status 200)

### Step 5.4: Test Authentication (Optional)

If you set a `SYNC_TOKEN`:

```bash
# Without token (should fail):
curl -X GET https://api.stampcoin.com/sync
# Response: {"error":"Unauthorized"}

# With token (should work):
curl -X GET https://api.stampcoin.com/sync \
  -H "Authorization: Bearer YOUR-TOKEN-HERE"
# Response: {"todos":[]}
```

### Step 5.5: Test Full Workflow

1. Go to `https://stampcoin.com`
2. Create/modify data in the application
3. Trigger sync operation
4. Verify data persists on next reload
5. Check Network tab shows successful API calls to `api.stampcoin.com`

### Step 5.6: Performance Testing

**Website Performance:**
- Open `https://stampcoin.com`
- Press F12 → Lighthouse tab
- Click "Analyze page load"
- Target: Green scores (>90)

**API Response Time:**
- Open DevTools Network tab
- Look at `/sync` request timing
- Target: <500ms response time

**Page Load Time:**
- Full page should load in <2 seconds
- Content should be interactive

---

## Troubleshooting

### GitHub Pages Not Showing Content

**Problem:** Website shows 404 or blank page

**Solution:**

1. Check GitHub Actions:
   - Go to **Actions** tab
   - Look for "Deploy to GitHub Pages"
   - Click latest workflow
   - Check for red (✗) or green (✓) status

2. Verify CNAME file:
   ```bash
   cat stp/CNAME
   # Should output: stampcoin.com
   ```

3. Check branch protection:
   - Go to **Settings** → **Branches**
   - Ensure main branch allows pushes

4. Force rebuild:
   - Go to **Actions**
   - Select "Deploy to GitHub Pages"
   - Click **Run workflow**
   - Select **main** branch
   - Click **Run workflow**

### API Not Responding

**Problem:** API requests return 503 or timeout

**Solution:**

1. **Free tier sleep mode:**
   - Render free tier services sleep after 15 min
   - Upgrade to Starter Pro ($7/month) for production
   - OR make a test request to wake up service

2. **Check Render logs:**
   - Go to Render dashboard
   - Click your service
   - Click **Logs** tab
   - Look for error messages

3. **Check environment variables:**
   - Go to **Environment** settings
   - Verify `PORT=8080`
   - Verify `SYNC_TOKEN` is set (if using authentication)

4. **Redeploy:**
   - Click **Manual Deploy** in Render
   - Select **Deploy latest commit**

### DNS Not Working

**Problem:** Domain shows "can't reach server" or old IP

**Solution:**

1. **Clear DNS cache:**
   ```bash
   # macOS
   sudo dscacheutil -flushcache
   
   # Windows (PowerShell as admin)
   ipconfig /flushdns
   
   # Linux
   sudo systemctl restart systemd-resolved
   ```

2. **Wait for propagation:**
   - DNS changes take up to 24 hours
   - Check status at https://whatsmydns.net

3. **Verify DNS records:**
   - Use `nslookup` or `dig`:
   ```bash
   nslookup stampcoin.com
   nslookup api.stampcoin.com
   ```

4. **Check registrar settings:**
   - Log in to domain registrar
   - Verify A records point to GitHub IPs
   - Verify CNAME points to Render

### CORS Errors

**Problem:** Browser console shows "CORS error" or "blocked by policy"

**Solution:**

1. **Check Express CORS setup:**
   ```javascript
   // In server.js, should have:
   const cors = require('cors');
   app.use(cors());
   ```

2. **Verify API endpoint URL:**
   - Frontend must call `https://api.stampcoin.com`
   - Not `http://` (must be HTTPS)
   - Not `localhost:8080` (must use domain)

3. **Check browser console:**
   - Open F12 → Console
   - Look for exact error message
   - Verify request URL in Network tab

### SSL Certificate Issues

**Problem:** Browser shows "This connection is not private" or SSL warnings

**Solution:**

1. **GitHub Pages:**
   - Automatically managed
   - Should be ready 5-10 minutes after domain setup
   - Check **Settings** → **Pages** → **Custom domain** section

2. **Render API:**
   - Go to service settings
   - Check "Custom Domain" section
   - Should show "SSL certificate issued"
   - If not, wait 5-10 minutes and refresh

3. **Force HTTPS:**
   - In Render settings, enable "Redirect HTTP to HTTPS"

---

## Post-Deployment Checklist

Complete this checklist to ensure everything works:

### Website (GitHub Pages)

- [ ] Domain `https://stampcoin.com` loads without errors
- [ ] HTTPS certificate is valid (green padlock)
- [ ] All pages load (index.html, README, docs)
- [ ] Images and assets display correctly
- [ ] Mobile responsive design works
- [ ] No console errors (F12 → Console)
- [ ] GitHub Actions show successful deployment

### API (Render.com)

- [ ] `https://api.stampcoin.com/sync` responds with 200 status
- [ ] Response time is <500ms
- [ ] Data persists across requests
- [ ] Authentication works (if configured)
- [ ] Render logs show no errors
- [ ] Auto-deploy is enabled

### DNS & Domain

- [ ] `stampcoin.com` A records point to GitHub IPs
- [ ] `api.stampcoin.com` CNAME points to Render
- [ ] DNS propagation is complete (check whatsmydns.net)
- [ ] No mixed HTTP/HTTPS content
- [ ] SSL certificates installed and valid

### Integration

- [ ] Frontend can call API successfully
- [ ] Network requests show correct domains
- [ ] Data sync works end-to-end
- [ ] No CORS errors in console
- [ ] Application features work as expected

### Performance

- [ ] Website Lighthouse score >90 (Performance, Accessibility)
- [ ] API response time <500ms
- [ ] Page load time <2 seconds
- [ ] No 404 errors in Network tab

### Security

- [ ] All traffic is HTTPS (no HTTP)
- [ ] No sensitive data in frontend code
- [ ] SYNC_TOKEN is strong and unique
- [ ] Environment variables are secure
- [ ] No API keys exposed in logs

### Monitoring

- [ ] Set up monitoring alerts in Render
- [ ] Check logs regularly for errors
- [ ] Test uptime regularly
- [ ] Monitor API response times

---

## Deployment Timeline

| Step | Estimated Time | Status |
|------|---|--------|
| 1. Enable GitHub Pages | 5 min | ✓ Done |
| 2. Deploy to Render | 10 min | ⏳ In Progress |
| 3. Register Domain | 10 min | ⏳ In Progress |
| 4. Configure DNS | 5 min | ⏳ In Progress |
| 5. DNS Propagation | 15 min - 24 hrs | ⏳ In Progress |
| 6. Test Integration | 10 min | ⏳ Pending |
| **Total** | **50 min - 1 day** | |

---

## Support & Resources

### Official Documentation

- GitHub Pages: https://pages.github.com
- Render Docs: https://render.com/docs
- DNS Guide: https://mxtoolbox.com/dnscheck.aspx

### Tools

- DNS Checker: https://mxtoolbox.com/nslookup.aspx
- DNS Propagation: https://whatsmydns.net
- SSL Checker: https://www.sslshopper.com/ssl-checker.html

### Community

- GitHub Issues: https://github.com/zedanazad43/stp/issues
- Render Support: support@render.com

---

## Next Steps

After deployment:

1. **Monitor Performance**
   - Check Render logs daily first week
   - Monitor API response times
   - Track user feedback

2. **Optimize**
   - Enable caching headers
   - Compress assets
   - Consider CDN for assets

3. **Scale**
   - Upgrade Render plan if needed
   - Add database for persistence
   - Implement backups

4. **Maintain**
   - Keep dependencies updated
   - Monitor security alerts
   - Regular backups

---

**Deployment Guide Complete**

Questions? Check troubleshooting section or open an issue on GitHub.

Last updated: 2024
