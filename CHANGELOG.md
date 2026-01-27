# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-01-27

### Added

- Initial release of Secrets Sync Manager
- Interactive terminal UI with menu-driven interface
- Multi-machine support (configure multiple sync targets)
- Bidirectional sync (push/pull operations)
- Dry-run mode for previewing changes
- Batch operations (sync to all machines at once)
- Desktop launcher for Linux Mint/Ubuntu
- Configuration management (`~/.config/secrets-sync/machines.conf`)
- Installation and uninstallation scripts
- Comprehensive documentation (README.md, DIRECTORY.md)
- Example configuration file

### Features

- Project-agnostic design (works with any project using `~/.secrets/`)
- SSH key-based authentication
- rsync for efficient file transfer
- Color-coded terminal output
- Error handling and user prompts
- Preserves file permissions and timestamps

### Documentation

- Full user guide (README.md)
- Directory structure reference (DIRECTORY.md)
- Configuration examples
- Troubleshooting guide
- Security best practices

---

## [Unreleased]

### Planned for v1.1.0

- Conflict detection and resolution
- GPG encryption at rest
- Backup before sync (with rollback capability)
- Sync history and logs
- Progress indicators for large transfers

### Planned for v2.0.0

- GUI application (GTK/Qt)
- Webhook notifications (Discord, Slack)
- Scheduled automatic syncs (cron integration)
- Multi-directional sync (mesh network)
- Cloud storage integration (optional)

---

## Version History

- **1.0.0** (2026-01-27) - Initial release
