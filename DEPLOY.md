# 🚀 Deploy Guide — Deema Talat Portfolio

## Option A — Netlify (Easiest, 2 minutes)

### Method 1: Drag & Drop (No account needed)
1. Open your terminal in the portfolio folder
2. Run the build:
   ```bash
   flutter pub get
   flutter build web --release
   ```
3. Go to **https://app.netlify.com/drop**
4. Drag the `build/web` folder into the browser window
5. Done — you get a live URL instantly (e.g. `https://amazing-name-123.netlify.app`)

### Method 2: Netlify + GitHub (Auto-deploys on every push)
1. Push this project to a GitHub repo
2. Go to **https://app.netlify.com** → New site → Import from Git
3. Select your repo
4. Build settings are already in `netlify.toml` — just click **Deploy**
5. Every `git push` to `main` auto-rebuilds and deploys ✅

---

## Option B — GitHub Pages (Free, automatic)

### Step 1: Create GitHub repo
```bash
cd C:\Users\deema\StudioProjects\portfolio
git init
git add .
git commit -m "Initial portfolio commit"
git branch -M main
git remote add origin https://github.com/deematalat/portfolio.git
git push -u origin main
```

### Step 2: Enable GitHub Pages with Actions
1. Go to your repo on GitHub
2. Settings → Pages → Source → **GitHub Actions**
3. The workflow in `.github/workflows/deploy.yml` runs automatically
4. Your site will be live at: **https://deematalat.github.io/portfolio/**

### Step 3: Every update
```bash
git add .
git commit -m "Update portfolio"
git push
```
GitHub Actions builds and deploys automatically in ~3 minutes.

---

## Option C — Firebase Hosting

```bash
# Install Firebase CLI (once)
npm install -g firebase-tools

# Login
firebase login

# Init (first time only)
firebase init hosting
# → Use existing project or create new
# → Public directory: build/web
# → Single-page app: Yes
# → Overwrite index.html: No

# Build and deploy
flutter build web --release
firebase deploy

# Live at: https://YOUR-PROJECT.web.app
```

---

## Custom Domain (Optional)

After deploying to Netlify or GitHub Pages:
1. Buy a domain (e.g. `deematalat.com`) from Namecheap or Google Domains
2. In Netlify: Site settings → Domain management → Add custom domain
3. Add a CNAME record pointing to your Netlify/GitHub Pages URL
4. HTTPS is automatic ✅

---

## Build Commands Reference

| Command | Purpose |
|---------|---------|
| `flutter pub get` | Install dependencies |
| `flutter run -d chrome` | Preview locally |
| `flutter build web --release` | Production build |
| `flutter build web --release --base-href "/portfolio/"` | Build for GitHub Pages subfolder |

---

## Files in this project

```
portfolio/
├── lib/main.dart              ← All Flutter code (single file)
├── assets/
│   ├── cv/Deema_Talat_CV.pdf  ← Your CV (downloads on button click)
│   └── images/                ← All 5 project screenshots + your photo
├── web/
│   ├── index.html             ← SEO meta tags + splash screen
│   └── manifest.json          ← PWA config
├── .github/workflows/
│   └── deploy.yml             ← Auto GitHub Pages deploy
├── netlify.toml               ← Auto Netlify deploy config
└── pubspec.yaml               ← Flutter dependencies
```
