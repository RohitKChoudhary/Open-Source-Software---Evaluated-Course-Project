#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Rohit Kumar | Reg No: 24BAI10294
# Course: Open Source Software
# Description: Loops through important Linux directories and
#              reports their disk usage, owner, and permissions.
#              Also checks Git's config directory specifically.
# ============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/share/git-core")

echo "============================================================"
echo "       Disk and Permission Auditor"
echo "============================================================"
echo ""
echo "  Auditing key system directories..."
echo ""
printf "  %-25s %-20s %-10s\n" "Directory" "Permissions/Owner" "Size"
echo "  ---------------------------------------------------------------"

# --- For loop: iterate over each directory in the list ---
for DIR in "${DIRS[@]}"; do
    # Check if the directory actually exists before trying to inspect it
    if [ -d "$DIR" ]; then
        # Extract permissions and owner using ls and awk
        # ls -ld gives long listing for the directory itself (not contents)
        # awk picks column 1 (permissions), column 3 (owner), column 4 (group)
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3 ":" $4}')

        # Get disk usage using du, suppress permission errors with 2>/dev/null
        # cut -f1 takes only the size column, not the directory name
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print formatted output
        printf "  %-25s %-20s %-10s\n" "$DIR" "$PERMS" "$SIZE"
    else
        # Directory does not exist on this system
        printf "  %-25s %s\n" "$DIR" "-- does not exist on this system --"
    fi
done

echo ""
echo "------------------------------------------------------------"
echo "  Git Configuration Directory Check"
echo "------------------------------------------------------------"

# --- Check Git's main config directory ---
GIT_CONFIG_DIR="/etc/gitconfig"
GIT_SYSTEM_DIR="/usr/share/git-core"

# Check if the global git config file exists
if [ -f "$GIT_CONFIG_DIR" ]; then
    echo ""
    echo "  Git global config file found: $GIT_CONFIG_DIR"
    # Show its permissions
    GITPERMS=$(ls -l "$GIT_CONFIG_DIR" | awk '{print "Permissions:", $1, "| Owner:", $3}')
    echo "  $GITPERMS"
else
    echo ""
    echo "  Git global config file (/etc/gitconfig) not found."
    echo "  This is normal if Git has not been configured system-wide yet."
    echo "  You can create user-level config by running: git config --global user.name"
fi

# Check if the git system data directory exists
if [ -d "$GIT_SYSTEM_DIR" ]; then
    echo ""
    echo "  Git system data directory: $GIT_SYSTEM_DIR"
    GITSYSPERMS=$(ls -ld "$GIT_SYSTEM_DIR" | awk '{print "Permissions:", $1, "| Owner:", $3}')
    echo "  $GITSYSPERMS"
    GITSYSSIZE=$(du -sh "$GIT_SYSTEM_DIR" 2>/dev/null | cut -f1)
    echo "  Size: $GITSYSSIZE"
fi

echo ""
echo "============================================================"
echo "  Audit complete."
echo "============================================================"
