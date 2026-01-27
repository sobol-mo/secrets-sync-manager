# Secrets Sync Manager - Tool Directory

**Location:** `~/bin/secrets-sync/`  
**Version:** 1.0.0  
**Purpose:** Universal secrets synchronization across machines

---

## Directory Structure

```
~/bin/secrets-sync/
├── secrets-sync              # Main executable script
├── install.sh                # Installation script
├── uninstall.sh              # Uninstallation script
├── README.md                 # Full documentation
├── DIRECTORY.md              # This file
└── config/
    └── machines.conf.example # Configuration template
```

---

## Quick Start

### Installation

```bash
# Run installer
~/bin/secrets-sync/install.sh

# This creates:
# - Symlink: ~/bin/secrets-sync-tool
# - Desktop launcher: ~/.local/share/applications/secrets-sync.desktop
# - Configuration: ~/.config/secrets-sync/machines.conf
```

### Usage

```bash
# Run from anywhere
secrets-sync-tool

# Or from menu
# Menu → System → Secrets Sync Manager
```

### Uninstallation

```bash
~/bin/secrets-sync/uninstall.sh
```

---

## Files

### secrets-sync

Main executable script. Interactive terminal UI for syncing `~/.secrets/` across machines.

### install.sh

Sets up the tool:

- Creates symlink in `~/bin/`
- Adds to PATH
- Creates desktop launcher
- Initializes configuration

### uninstall.sh

Removes the tool:

- Removes symlink
- Removes desktop launcher
- Optionally removes configuration
- Preserves `~/.secrets/` directory

### README.md

Complete documentation:

- Installation guide
- Configuration reference
- Usage examples
- Troubleshooting
- Security best practices

### config/machines.conf.example

Template for machine configuration. Copy to `~/.config/secrets-sync/machines.conf` and customize.

---

## Configuration

**Location:** `~/.config/secrets-sync/machines.conf`

**Format:**

```
NAME|USER|HOST
```

**Example:**

```
MWC2|maxim|192.168.1.20
VPS|root|46.62.165.153
```

---

## Integration

### Terraform

```bash
# Secrets automatically available via symlink
cd ~/dev/projects/My_AI_Assistant/10_Implementation/python/terraform
terraform plan  # Uses ~/.secrets/.../terraform.tfvars
```

### Docker Compose

```bash
# Symlink .env from secrets
ln -sf ~/.secrets/projects/myapp/.env ~/dev/projects/myapp/.env
```

### Any Project

```bash
# All projects use ~/.secrets/
# Sync once, available everywhere
secrets-sync-tool --push-all
```

---

## Maintenance

### Update Configuration

```bash
nano ~/.config/secrets-sync/machines.conf
```

### View Logs

```bash
# No logs by default
# Add logging if needed in secrets-sync script
```

### Backup

```bash
# Backup entire tool directory
tar -czf secrets-sync-backup.tar.gz ~/bin/secrets-sync/

# Backup configuration
cp ~/.config/secrets-sync/machines.conf ~/backups/
```

---

## Troubleshooting

### Command not found

```bash
# Ensure ~/bin is in PATH
echo $PATH | grep "$HOME/bin"

# If not, add to ~/.bashrc
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### Desktop launcher doesn't appear

```bash
# Update desktop database
update-desktop-database ~/.local/share/applications/

# Or log out and back in
```

### Sync fails

```bash
# Test SSH connection
ssh user@remote-host

# Set up SSH keys
ssh-copy-id user@remote-host
```

---

## Development

### Modify Script

```bash
# Edit main script
nano ~/bin/secrets-sync/secrets-sync

# Test changes
~/bin/secrets-sync/secrets-sync

# No reinstall needed (symlink points to this file)
```

### Add Features

1. Edit `secrets-sync` script
2. Update version number
3. Update README.md
4. Test thoroughly
5. Commit to Git (if versioned)

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | 2026-01-27 | Initial release |

---

## Support

**Documentation:** `README.md` in this directory  
**Configuration:** `~/.config/secrets-sync/machines.conf`  
**Issues:** Contact Maxim

---

**Last Updated:** 2026-01-27
