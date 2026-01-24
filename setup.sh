#!/bin/bash
# setup.sh - OrgMacs Installation Script

set -e  # Exit on error

echo "========================================="
echo "  OrgMacs Setup Script"
echo "========================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if Emacs is installed
if ! command -v emacs &> /dev/null; then
    echo -e "${RED}Error: Emacs is not installed${NC}"
    echo "Please install Emacs first"
    exit 1
fi

echo -e "${GREEN}✓ Emacs found: $(emacs --version | head -n1)${NC}"
echo ""

# Create directory structure
echo "Creating directory structure..."
mkdir -p ~/.emacs.d/config
echo -e "${GREEN}✓ Created ~/.emacs.d/config${NC}"
echo ""

# Check if org files exist
ORG_FILES=(
    "~/.emacs.d/init.org"
    "~/.emacs.d/config/core.org"
    "~/.emacs.d/config/ui.org"
    "~/.emacs.d/config/editing.org"
    "~/.emacs.d/config/programming.org"
    "~/.emacs.d/config/languages.org"
    "~/.emacs.d/config/infrastructure.org"
    "~/.emacs.d/config/org-mode.org"
    "~/.emacs.d/config/files.org"
)

echo "Checking for org files..."
MISSING_FILES=0
for file in "${ORG_FILES[@]}"; do
    expanded_file="${file/#\~/$HOME}"
    if [ ! -f "$expanded_file" ]; then
        echo -e "${RED}✗ Missing: $file${NC}"
        MISSING_FILES=$((MISSING_FILES + 1))
    else
        echo -e "${GREEN}✓ Found: $file${NC}"
    fi
done

if [ $MISSING_FILES -gt 0 ]; then
    echo ""
    echo -e "${RED}Error: $MISSING_FILES org file(s) missing${NC}"
    echo "Please copy all org files to ~/.emacs.d/ first"
    exit 1
fi

echo ""
echo -e "${YELLOW}Starting tangling process...${NC}"
echo "This will generate all .el files from .org files"
echo ""

# Tangle init.org first
echo "Tangling init.org..."
emacs --batch \
    --eval "(require 'org)" \
    --eval "(setq org-confirm-babel-evaluate nil)" \
    --eval "(org-babel-tangle-file \"$HOME/.emacs.d/init.org\")" 2>&1 | grep -v "^Loading"

if [ -f ~/.emacs.d/init.el ] && [ -f ~/.emacs.d/early-init.el ]; then
    echo -e "${GREEN}✓ Generated init.el and early-init.el${NC}"
else
    echo -e "${RED}✗ Failed to generate init files${NC}"
    exit 1
fi

# Tangle all config files
echo ""
echo "Tangling config files..."
for orgfile in ~/.emacs.d/config/*.org; do
    filename=$(basename "$orgfile")
    echo "  Processing $filename..."
    emacs --batch \
        --eval "(require 'org)" \
        --eval "(setq org-confirm-babel-evaluate nil)" \
        --eval "(org-babel-tangle-file \"$orgfile\")" 2>&1 | grep -v "^Loading"
    
    # Check if corresponding .el file was created
    elfile="${orgfile%.org}-config.el"
    if [ -f "$elfile" ]; then
        echo -e "  ${GREEN}✓ Generated $(basename "$elfile")${NC}"
    else
        echo -e "  ${RED}✗ Failed to generate $(basename "$elfile")${NC}"
    fi
done

echo ""
echo "========================================="
echo -e "${GREEN}Setup Complete!${NC}"
echo "========================================="
echo ""
echo "Generated files:"
echo "  - init.el"
echo "  - early-init.el"
echo "  - config/*.el (8 files)"
echo ""
echo "Next steps:"
echo "  1. Review the generated files (optional)"
echo "  2. Start Emacs: emacs"
echo "  3. Wait for packages to install"
echo ""
echo "Useful commands:"
echo "  C-c e  - Edit configuration"
echo "  C-c r  - Reload configuration"
echo ""