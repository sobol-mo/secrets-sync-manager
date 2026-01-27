#!/bin/bash
# Uninstallation script for Universal Secrets Sync Manager

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${NC}    Uninstalling Universal Secrets Sync Manager...        ${CYAN}║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

echo -e "${YELLOW}⚠${NC} This will remove the Secrets Sync Manager tool."
echo -e "${YELLOW}⚠${NC} Your secrets in ~/.secrets/ will NOT be deleted."
echo ""
read -p "Continue? (y/N): " confirm

if [ "$confirm" != "y" ]; then
    echo "Cancelled."
    exit 0
fi

echo ""

# Step 1: Remove symlink
echo "🔗 Step 1: Removing symlink..."
if [ -L ~/bin/secrets-sync-tool ]; then
    rm ~/bin/secrets-sync-tool
    echo -e "${GREEN}✓${NC} Removed symlink"
else
    echo -e "${YELLOW}ℹ${NC} Symlink not found"
fi
echo ""

# Step 2: Remove desktop launcher
echo "🖥️  Step 2: Removing desktop launcher..."
if [ -f ~/.local/share/applications/secrets-sync.desktop ]; then
    rm ~/.local/share/applications/secrets-sync.desktop
    echo -e "${GREEN}✓${NC} Removed desktop launcher"
else
    echo -e "${YELLOW}ℹ${NC} Desktop launcher not found"
fi
echo ""

# Step 3: Ask about configuration
echo "⚙️  Step 3: Configuration files..."
read -p "Remove configuration (~/.config/secrets-sync/)? (y/N): " remove_config

if [ "$remove_config" = "y" ]; then
    if [ -d ~/.config/secrets-sync ]; then
        rm -rf ~/.config/secrets-sync
        echo -e "${GREEN}✓${NC} Removed configuration"
    else
        echo -e "${YELLOW}ℹ${NC} Configuration not found"
    fi
else
    echo -e "${YELLOW}ℹ${NC} Keeping configuration"
fi
echo ""

# Step 4: Ask about tool directory
echo "📁 Step 4: Tool directory..."
read -p "Remove tool directory (~/bin/secrets-sync/)? (y/N): " remove_dir

if [ "$remove_dir" = "y" ]; then
    if [ -d ~/bin/secrets-sync ]; then
        rm -rf ~/bin/secrets-sync
        echo -e "${GREEN}✓${NC} Removed tool directory"
    else
        echo -e "${YELLOW}ℹ${NC} Tool directory not found"
    fi
else
    echo -e "${YELLOW}ℹ${NC} Keeping tool directory"
fi
echo ""

# Summary
echo -e "${CYAN}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${NC}              Uninstallation Complete! ✅                   ${CYAN}║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo "📋 What was preserved:"
echo ""
echo "  ✓ Your secrets: ~/.secrets/"
if [ "$remove_config" != "y" ]; then
    echo "  ✓ Configuration: ~/.config/secrets-sync/"
fi
if [ "$remove_dir" != "y" ]; then
    echo "  ✓ Tool directory: ~/bin/secrets-sync/"
fi
echo ""
echo "To reinstall, run:"
echo "  ~/bin/secrets-sync/install.sh"
echo ""
