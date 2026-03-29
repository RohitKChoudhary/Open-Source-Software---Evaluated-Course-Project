#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: Rohit Kumar | Reg No: 24BAI10294
# Course: Open Source Software
# Description: Displays a welcome screen with system details
#              including distro, kernel, user, uptime, and
#              the open source license that covers the OS.
# ============================================================

# --- Student and software details ---
STUDENT_NAME="Rohit Kumar"
REG_NO="24BAI10294"
SOFTWARE_CHOICE="Git"

# --- Collect system information using command substitution ---
KERNEL=$(uname -r)                         # Get kernel version
USER_NAME=$(whoami)                        # Get current logged-in user
HOME_DIR=$HOME                             # Get home directory of current user
UPTIME=$(uptime -p)                        # Get system uptime in human-readable form
CURRENT_DATE=$(date '+%d %B %Y, %H:%M:%S') # Get current date and time
DISTRO=$(lsb_release -d 2>/dev/null | cut -f2 || cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')

# --- Display the report ---
echo "============================================================"
echo "       OPEN SOURCE AUDIT -- System Identity Report"
echo "============================================================"
echo ""
echo "  Student Name    : $STUDENT_NAME"
echo "  Reg Number      : $REG_NO"
echo "  Chosen Software : $SOFTWARE_CHOICE"
echo ""
echo "------------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "------------------------------------------------------------"
echo "  Distribution    : $DISTRO"
echo "  Kernel Version  : $KERNEL"
echo "  Logged-in User  : $USER_NAME"
echo "  Home Directory  : $HOME_DIR"
echo "  System Uptime   : $UPTIME"
echo "  Date and Time   : $CURRENT_DATE"
echo ""
echo "------------------------------------------------------------"
echo "  LICENSE INFORMATION"
echo "------------------------------------------------------------"
# Ubuntu and most Linux distributions are covered under GPL
echo "  This operating system (Ubuntu/Linux) is distributed"
echo "  under the GNU General Public License version 2 (GPL v2)."
echo "  The GPL grants users the freedom to run, study, share,"
echo "  and modify the software."
echo ""
echo "  Git (chosen software) is also licensed under GPL v2."
echo "============================================================"
