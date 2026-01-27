#!/bin/bash
# Installation script for Universal Secrets Sync Manager
# Location: ~/bin/secrets-sync/install.sh

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

TOOL_DIR="$HOME/bin/secrets-sync"
SCRIPT_PATH="$TOOL_DIR/secrets-sync"
SYMLINK_PATH="$HOME/bin/secrets-sync-tool"

echo -e "${CYAN}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${NC}    Installing Universal Secrets Sync Manager...           ${CYAN}║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Step 1: Verify tool directory exists
echo "📁 Step 1: Verifying tool directory..."
if [ ! -d "$TOOL_DIR" ]; then
    echo -e "${RED}✗${NC} Tool directory not found: $TOOL_DIR"
    exit 1
fi
echo -e "${GREEN}✓${NC} Tool directory exists"
echo ""

# Step 2: Make script executable
echo "🔧 Step 2: Making script executable..."
chmod +x "$SCRIPT_PATH"
chmod +x "$TOOL_DIR/uninstall.sh"
echo -e "${GREEN}✓${NC} Made executable"
echo ""

# Step 3: Create symlink in ~/bin
echo "🔗 Step 3: Creating symlink..."
if [ -L "$SYMLINK_PATH" ]; then
    echo -e "${YELLOW}ℹ${NC} Symlink already exists, updating..."
    rm "$SYMLINK_PATH"
fi
ln -sf "$SCRIPT_PATH" "$SYMLINK_PATH"
echo -e "${GREEN}✓${NC} Created symlink: secrets-sync-tool"
echo ""

# Step 4: Add ~/bin to PATH if not already there
echo "🛤️  Step 4: Checking PATH..."
if echo "$PATH" | grep -q "$HOME/bin"; then
    echo -e "${GREEN}✓${NC} ~/bin already in PATH"
else
    echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
    echo -e "${GREEN}✓${NC} Added ~/bin to PATH in ~/.bashrc"
    echo -e "${YELLOW}ℹ${NC} Restart your terminal or run: source ~/.bashrc"
fi
echo ""

# Step 5: Set up desktop launcher
echo "🖥️  Step 5: Setting up desktop launcher..."
mkdir -p ~/.local/share/applications

cat > ~/.local/share/applications/secrets-sync.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Secrets Sync Manager
Comment=Sync secrets across multiple machines
Exec=x-terminal-emulator -e bash -c "$SYMLINK_PATH; read -p 'Press Enter to close...'"
Icon=folder-sync
Terminal=false
Categories=System;Utility;
Keywords=sync;secrets;rsync;backup;
StartupNotify=true
EOF

chmod +x ~/.local/share/applications/secrets-sync.desktop
echo -e "${GREEN}✓${NC} Desktop launcher configured"
echo ""

# Step 6: Create configuration
echo "⚙️  Step 6: Creating configuration..."
mkdir -p ~/.config/secrets-sync

if [ ! -f ~/.config/secrets-sync/machines.conf ]; then
    # Copy example if it exists, otherwise create default
    if [ -f "$TOOL_DIR/config/machines.conf.example" ]; then
        cp "$TOOL_DIR/config/machines.conf.example" ~/.config/secrets-sync/machines.conf
    else
        cat > ~/.config/secrets-sync/machines.conf << 'CONF'
# Secrets Sync - Machine Configuration
# Format: NAME|USER|HOST
# Example: VPS|root|192.168.1.100

# Your machines (update with actual IPs/hostnames):
# SWC|maxim|192.168.1.10
MWC2|maxim|192.168.1.20
MWC3|maxim|192.168.1.30
VPS|root|46.62.165.153

# Add more machines as needed
CONF
    fi
    echo -e "${GREEN}✓${NC} Created configuration file"
else
    echo -e "${YELLOW}ℹ${NC} Configuration file already exists"
fi
echo ""

# Step 7: Create secrets directory if it doesn't exist
echo "🔐 Step 7: Checking secrets directory..."
if [ ! -d ~/.secrets ]; then
    mkdir -p ~/.secrets
    chmod 700 ~/.secrets
    echo -e "${GREEN}✓${NC} Created ~/.secrets directory"
else
    echo -e "${GREEN}✓${NC} ~/.secrets directory exists"
fi
echo ""

# Summary
echo -e "${CYAN}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${NC}                 Installation Complete! ✅                  ${CYAN}║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo "📋 Next Steps:"
echo ""
echo "1. Configure your machines:"
echo "   nano ~/.config/secrets-sync/machines.conf"
echo ""
echo "2. Run the sync manager:"
echo "   secrets-sync-tool"
echo ""
echo "   Or find it in your application menu:"
echo "   Menu → System → Secrets Sync Manager"
echo ""
echo "3. Set up SSH keys for passwordless access:"
echo "   ssh-copy-id user@remote-host"
echo ""
echo "📚 Documentation:"
echo "   cat ~/bin/secrets-sync/README.md"
echo ""
echo "🗑️  To uninstall:"
echo "   ~/bin/secrets-sync/uninstall.sh"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
