# 🔐 Secrets Sync Manager

**Universal tool for synchronizing `~/.secrets/` directory across multiple machines**

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/yourusername/secrets-sync-manager)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Linux-lightgrey.svg)](https://www.linux.org/)

---

## 📋 Overview

Secrets Sync Manager is a project-agnostic tool that helps you keep your secrets (API tokens, credentials, configuration files) synchronized across multiple machines using rsync over SSH.

### ✨ Features

- 🚀 **Project-Agnostic**: Works with Terraform, Docker Compose, Python, or any project
- 🖥️ **Multi-Machine Support**: Sync to/from multiple machines (desktop, laptops, VPS)
- 🎨 **Interactive GUI**: Beautiful terminal UI with menu-driven interface
- 🐧 **Linux Integration**: Desktop launcher for Linux Mint/Ubuntu
- 🔄 **Bidirectional Sync**: Push (→) or Pull (←) secrets
- 🔍 **Dry-Run Mode**: Preview changes before syncing
- 📦 **Batch Operations**: Sync to all machines at once
- 🔒 **Secure**: Uses SSH keys for authentication

---

## 🎯 Use Cases

### Terraform

Keep `terraform.tfvars` synced across machines:

```bash
~/.secrets/projects/myapp/terraform/terraform.tfvars
```

### Docker Compose

Sync `.env` files:

```bash
~/.secrets/projects/myapp/.env
```

### API Keys

Centralize all credentials:

```bash
~/.secrets/api_keys/openai.txt
~/.secrets/api_keys/github_token.txt
```

---

## 🚀 Quick Start

### Installation

```bash
# Clone repository
git clone https://github.com/yourusername/secrets-sync-manager.git
cd secrets-sync-manager

# Run installer
./install.sh
```

### Configuration

Edit `~/.config/secrets-sync/machines.conf`:

```
# Format: NAME|USER|HOST
LAPTOP|maxim|192.168.1.20
VPS|root|example.com
```

### Usage

```bash
# Launch interactive mode
secrets-sync-tool

# Or use from application menu
# Menu → System → Secrets Sync Manager
```

---

## 📖 Documentation

- **[Full Documentation](README.md)** - Complete user guide
- **[Directory Structure](DIRECTORY.md)** - File organization
- **[Configuration Example](config/machines.conf.example)** - Sample config

---

## 🛠️ How It Works

```
┌─────────────┐
│  Desktop    │  1. Edit secrets locally
│  ~/.secrets/│  2. Run: secrets-sync-tool
└──────┬──────┘  3. Select "Push" and target machine
       │
       │ rsync -avz ~/.secrets/ user@remote:~/.secrets/
       │
       ▼
┌─────────────┐
│  VPS        │  4. Secrets synced to remote
│  ~/.secrets/│  5. Ready to use!
└─────────────┘
```

---

## 💡 Example Workflow

### Scenario: Update Terraform Secrets

```bash
# 1. Edit secrets on desktop
nano ~/.secrets/projects/myapp/terraform/terraform.tfvars

# 2. Launch sync manager
secrets-sync-tool

# 3. Select "Push secrets"
# 4. Select "All machines"
# 5. ✅ Secrets synced to all machines!
```

---

## 🔧 Requirements

- **OS**: Linux (Ubuntu, Debian, Linux Mint, etc.)
- **Shell**: Bash
- **Tools**: rsync, ssh
- **Optional**: Desktop environment for menu integration

---

## 📁 Directory Structure

```
~/bin/secrets-sync/
├── secrets-sync              # Main executable
├── install.sh                # Installation script
├── uninstall.sh              # Uninstallation script
├── README.md                 # Full documentation
├── DIRECTORY.md              # Directory overview
└── config/
    └── machines.conf.example # Configuration template
```

---

## 🔒 Security Best Practices

### ✅ Do This

- Use SSH keys (not passwords)
- Set `chmod 700 ~/.secrets`
- Set `chmod 600` on secret files
- Use different credentials for dev/staging/prod
- Regularly backup `~/.secrets/` (encrypted)

### ❌ Don't Do This

- Don't commit secrets to Git
- Don't sync over unsecured networks
- Don't share SSH keys between machines
- Don't use root unless necessary

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Development Setup

```bash
# Clone repository
git clone https://github.com/yourusername/secrets-sync-manager.git
cd secrets-sync-manager

# Make changes
nano secrets-sync

# Test locally
./secrets-sync

# Commit changes
git add .
git commit -m "feat: your feature description"
git push origin main
```

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- Built for managing secrets across multiple development machines
- Inspired by the need for simple, project-agnostic secret management
- Created as part of DevOps teaching materials

---

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/yourusername/secrets-sync-manager/issues)
- **Documentation**: See [README.md](README.md) for full documentation
- **Email**: <your.email@example.com>

---

## 🗺️ Roadmap

### v1.0.0 (Current)

- ✅ Interactive terminal UI
- ✅ Multi-machine support
- ✅ Push/Pull operations
- ✅ Dry-run mode
- ✅ Desktop launcher

### v1.1.0 (Planned)

- [ ] Conflict detection and resolution
- [ ] GPG encryption at rest
- [ ] Backup before sync (with rollback)
- [ ] Sync history and logs

### v2.0.0 (Future)

- [ ] GUI application (GTK/Qt)
- [ ] Webhook notifications
- [ ] Scheduled automatic syncs
- [ ] Multi-directional sync (mesh)

---

## ⭐ Star History

If you find this tool useful, please consider giving it a star on GitHub!

---

**Made with ❤️ by Maxim**

**Last Updated:** 2026-01-27  
**Version:** 1.0.0
