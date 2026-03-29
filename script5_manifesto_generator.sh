#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: Rohit Kumar | Reg No: 24BAI10294
# Course: Open Source Software
# Description: Asks the user three interactive questions and
#              generates a personalised open source philosophy
#              statement saved to a .txt file.
#
# Alias concept (demonstrated via comment):
#   In a real shell session you could set:
#   alias manifesto='bash script5_manifesto_generator.sh'
#   This would let you just type 'manifesto' to run this script.
# ============================================================

echo "============================================================"
echo "       Open Source Manifesto Generator"
echo "============================================================"
echo ""
echo "  This script will generate your personal open source"
echo "  philosophy statement based on your answers."
echo ""
echo "  Answer the following three questions:"
echo ""

# --- Read user input interactively ---
# read -p displays a prompt and waits for the user to type their answer

read -p "  1. Name one open-source tool you use every day: " TOOL
echo ""
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
echo ""
read -p "  3. Name one thing you would build and share freely: " BUILD
echo ""

# --- Get current date for the manifesto ---
DATE=$(date '+%d %B %Y')

# --- Get current user for naming the output file ---
CURRENT_USER=$(whoami)

# --- Define output file name using string concatenation ---
OUTPUT="manifesto_${CURRENT_USER}.txt"

echo "------------------------------------------------------------"
echo "  Generating your manifesto..."
echo "------------------------------------------------------------"
echo ""

# --- Write the manifesto to the output file using > (overwrite) ---
# Each echo >> appends a new line to the file
# We use > for the first line to create/clear the file, then >> to append

echo "============================================================" > "$OUTPUT"
echo "  MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "  By: $CURRENT_USER | Generated on: $DATE" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- Compose the manifesto paragraph using the user's answers ---
echo "  Every day, I rely on $TOOL to get my work done." >> "$OUTPUT"
echo "  It costs nothing. It hides nothing. Anyone can read" >> "$OUTPUT"
echo "  its code, change it, and share it. That is not just" >> "$OUTPUT"
echo "  convenience. That is $FREEDOM." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  I believe that the tools we build should serve people," >> "$OUTPUT"
echo "  not lock them in. When I think about what I want to" >> "$OUTPUT"
echo "  contribute to this world, I think about $BUILD." >> "$OUTPUT"
echo "  I would build it openly, document it clearly, and" >> "$OUTPUT"
echo "  release it for anyone to use without conditions." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  Open source is not just a license. It is a choice" >> "$OUTPUT"
echo "  to trust strangers, to invite collaboration, and to" >> "$OUTPUT"
echo "  believe that software made together is better than" >> "$OUTPUT"
echo "  software made in secret. I choose that side." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  Signed: $CURRENT_USER" >> "$OUTPUT"
echo "  Date  : $DATE" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"

# --- Confirm the file was saved ---
echo "  Manifesto saved to: $OUTPUT"
echo ""
echo "------------------------------------------------------------"
echo "  Here is your manifesto:"
echo "------------------------------------------------------------"
echo ""

# --- Display the file content using cat ---
cat "$OUTPUT"

echo ""
echo "============================================================"
