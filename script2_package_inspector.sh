#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: Rohit Kumar | Reg No: 24BAI10294
# Course: Open Source Software
# Description: Checks if a given open-source package is
#              installed, retrieves version and license info,
#              and prints a philosophy note using case statement.
# Usage: ./script2_package_inspector.sh [package-name]
#        If no argument given, defaults to 'git'
# ============================================================

# --- Set package name from argument or default to git ---
PACKAGE=${1:-git}

echo "============================================================"
echo "       FOSS Package Inspector"
echo "============================================================"
echo "  Checking package: $PACKAGE"
echo ""

# --- Check if the package is installed ---
# We try dpkg first (Ubuntu/Debian), then rpm (Fedora/CentOS)
if dpkg -l "$PACKAGE" &>/dev/null 2>&1; then
    # Package found via dpkg
    echo "  Status: $PACKAGE is INSTALLED on this system."
    echo ""
    echo "  Package Details:"
    echo "  ----------------"
    # Extract version and description from dpkg
    dpkg -l "$PACKAGE" | grep "^ii" | awk '{print "  Version : " $3}'
    # Get more detail from dpkg-query
    dpkg-query -W -f='  Description: ${Description}\n' "$PACKAGE" 2>/dev/null | head -2

elif rpm -q "$PACKAGE" &>/dev/null 2>&1; then
    # Package found via rpm
    echo "  Status: $PACKAGE is INSTALLED on this system."
    echo ""
    echo "  Package Details:"
    echo "  ----------------"
    # Print version, license and summary from rpm
    rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary' | awk '{print "  " $0}'

else
    # Package not found
    echo "  Status: $PACKAGE is NOT installed on this system."
    echo ""
    echo "  To install it on Ubuntu, run:"
    echo "  sudo apt install $PACKAGE"
fi

echo ""
echo "------------------------------------------------------------"
echo "  Open Source Philosophy Note"
echo "------------------------------------------------------------"

# --- Case statement: print a philosophy note based on package name ---
case $PACKAGE in
    git)
        echo "  Git: Born out of frustration with proprietary tools."
        echo "  Linus Torvalds built Git in 2005 when BitKeeper revoked"
        echo "  its free license. Git is proof that open source builds"
        echo "  better tools than proprietary software ever could."
        ;;
    httpd | apache2)
        echo "  Apache: The web server that helped build the open internet."
        echo "  It proved that community-driven software could power"
        echo "  the world's most critical infrastructure for free."
        ;;
    mysql | mariadb)
        echo "  MySQL: Open source at the heart of millions of apps."
        echo "  Its dual-license model shows how open source and"
        echo "  commercial software can coexist."
        ;;
    firefox)
        echo "  Firefox: A nonprofit fighting for an open and free web."
        echo "  It exists because the Mozilla community refused to let"
        echo "  one company control how the world browses the internet."
        ;;
    vlc)
        echo "  VLC: Built by students in Paris who just wanted to"
        echo "  stream a video over their university network. Today it"
        echo "  plays every format known to man, completely free."
        ;;
    python3 | python)
        echo "  Python: A language shaped entirely by its community."
        echo "  Guido van Rossum started it as a hobby project and"
        echo "  chose to share it. That choice changed programming forever."
        ;;
    *)
        # Default case for any other package
        echo "  $PACKAGE is an open-source tool that embodies the"
        echo "  principle that knowledge and software should be free"
        echo "  to use, study, share, and improve by everyone."
        ;;
esac

echo "============================================================"
