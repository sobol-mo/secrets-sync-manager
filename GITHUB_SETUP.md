# GitHub Setup Guide for Secrets Sync Manager

This guide explains how to push the secrets-sync-manager project to GitHub.

---

## Step 1: Create GitHub Repository

### Option A: Using GitHub Web Interface

1. Go to <https://github.com/new>
2. **Repository name:** `secrets-sync-manager`
3. **Description:** `Universal tool for synchronizing ~/.secrets/ across multiple machines`
4. **Visibility:** Public (or Private if you prefer)
5. **DO NOT** initialize with README, .gitignore, or license (we already have these)
6. Click **"Create repository"**

### Option B: Using GitHub CLI

```bash
# Install GitHub CLI (if not installed)
sudo apt install gh

# Authenticate
gh auth login

# Create repository
gh repo create secrets-sync-manager --public --description "Universal tool for synchronizing ~/.secrets/ across multiple machines"
```

---

## Step 2: Add Remote and Push

### Get the repository URL from GitHub

After creating the repository, GitHub will show you the URL. It will look like:

- HTTPS: `https://github.com/YOUR_USERNAME/secrets-sync-manager.git`
- SSH: `git@github.com:YOUR_USERNAME/secrets-sync-manager.git`

### Add remote and push

```bash
# Navigate to project
cd ~/dev/projects/secrets-sync-manager

# Add GitHub as remote (replace YOUR_USERNAME)
git remote add origin git@github.com:YOUR_USERNAME/secrets-sync-manager.git

# Or use HTTPS:
# git remote add origin https://github.com/YOUR_USERNAME/secrets-sync-manager.git

# Rename branch to main (if needed)
git branch -M main

# Push to GitHub
git push -u origin main
```

---

## Step 3: Verify on GitHub

1. Go to `https://github.com/YOUR_USERNAME/secrets-sync-manager`
2. You should see:
   - ✅ README.md displayed on homepage
   - ✅ 9 files (including LICENSE, CHANGELOG.md, etc.)
   - ✅ Initial commit message

---

## Step 4: Configure Repository Settings (Optional)

### Add Topics (Tags)

On GitHub repository page:

1. Click ⚙️ (Settings) or "About" section
2. Add topics:
   - `secrets-management`
   - `rsync`
   - `devops`
   - `terraform`
   - `docker-compose`
   - `linux`
   - `bash`

### Enable Issues and Discussions

1. Go to Settings → Features
2. Enable:
   - ✅ Issues
   - ✅ Discussions (optional)
   - ✅ Wiki (optional)

---

## Step 5: Update README with Correct URLs

After pushing, update the README.md with your actual GitHub username:

```bash
cd ~/dev/projects/secrets-sync-manager

# Replace placeholders in README
sed -i 's/yourusername/YOUR_ACTUAL_USERNAME/g' README.md
sed -i 's/your.email@example.com/your.actual@email.com/g' README.md

# Commit changes
git add README.md
git commit -m "docs: update README with actual GitHub URLs"
git push
```

---

## Step 6: Create First Release (Optional)

### Using GitHub Web Interface

1. Go to repository page
2. Click "Releases" → "Create a new release"
3. **Tag version:** `v1.0.0`
4. **Release title:** `v1.0.0 - Initial Release`
5. **Description:** Copy from CHANGELOG.md
6. Click "Publish release"

### Using GitHub CLI

```bash
cd ~/dev/projects/secrets-sync-manager

gh release create v1.0.0 \
  --title "v1.0.0 - Initial Release" \
  --notes "$(cat CHANGELOG.md | sed -n '/## \[1.0.0\]/,/## \[Unreleased\]/p' | head -n -2)"
```

---

## Step 7: Clone on Other Machines

Now you can easily install on other machines:

```bash
# On MWC2, MWC3, or VPS
git clone https://github.com/YOUR_USERNAME/secrets-sync-manager.git
cd secrets-sync-manager
./install.sh
```

---

## Future Updates

### Making Changes

```bash
cd ~/dev/projects/secrets-sync-manager

# Make changes
nano secrets-sync

# Test locally
./secrets-sync

# Commit and push
git add .
git commit -m "feat: add new feature"
git push
```

### Updating Installed Version

```bash
# On any machine with the tool installed
cd ~/dev/projects/secrets-sync-manager
git pull
~/bin/secrets-sync/install.sh  # Reinstall if needed
```

---

## Troubleshooting

### Permission denied (publickey)

**Problem:** Can't push to GitHub with SSH

**Solution:**

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your.email@example.com"

# Add to SSH agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Copy public key
cat ~/.ssh/id_ed25519.pub

# Add to GitHub:
# GitHub → Settings → SSH and GPG keys → New SSH key
```

### Remote already exists

**Problem:** `fatal: remote origin already exists`

**Solution:**

```bash
# Remove existing remote
git remote remove origin

# Add correct remote
git remote add origin git@github.com:YOUR_USERNAME/secrets-sync-manager.git
```

---

## Quick Command Reference

```bash
# Clone repository
git clone https://github.com/YOUR_USERNAME/secrets-sync-manager.git

# Check status
git status

# Add files
git add .

# Commit
git commit -m "message"

# Push
git push

# Pull latest
git pull

# View remotes
git remote -v

# View commit history
git log --oneline
```

---

## Next Steps

After pushing to GitHub:

1. ✅ Share repository URL with others
2. ✅ Add to your portfolio/CV
3. ✅ Star your own repository (why not? 😄)
4. ✅ Consider making it a template repository
5. ✅ Add GitHub Actions for automated testing (future)

---

**Repository URL:** `https://github.com/YOUR_USERNAME/secrets-sync-manager`

**Clone Command:** `git clone https://github.com/YOUR_USERNAME/secrets-sync-manager.git`
