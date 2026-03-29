#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: Rohit Kumar | Reg No: 24BAI10294
# Course: Open Source Software
# Description: Reads a log file line by line, counts how many
#              lines contain a given keyword, and prints a
#              summary along with the last 5 matching lines.
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# ============================================================

# --- Take log file path from first argument ---
LOGFILE=$1

# --- Take keyword from second argument, default is 'error' ---
KEYWORD=${2:-"error"}

# --- Counter variable to track matches ---
COUNT=0

echo "============================================================"
echo "       Log File Analyzer"
echo "============================================================"

# --- Validate that a log file argument was actually provided ---
if [ -z "$LOGFILE" ]; then
    echo ""
    echo "  Error: No log file specified."
    echo "  Usage: ./script4_log_analyzer.sh <logfile> [keyword]"
    echo "  Example: ./script4_log_analyzer.sh /var/log/syslog error"
    echo ""
    exit 1
fi

# --- Check if the file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo ""
    echo "  Error: File '$LOGFILE' not found."
    echo "  Please provide a valid log file path."
    echo ""

    # Retry suggestion: tell user which log files are available
    echo "  Available log files on this system:"
    ls /var/log/*.log 2>/dev/null | head -10 | awk '{print "    " $0}'
    echo ""
    exit 1
fi

# --- Check if the file is empty ---
# This is the do-while style retry check mentioned in the project
if [ ! -s "$LOGFILE" ]; then
    echo ""
    echo "  Warning: The file '$LOGFILE' is empty."
    echo "  Please try again with a log file that has content."
    echo ""
    exit 1
fi

echo ""
echo "  Log File : $LOGFILE"
echo "  Keyword  : '$KEYWORD'"
echo ""
echo "  Scanning file line by line..."
echo ""

# --- While-read loop: read the file one line at a time ---
# IFS= prevents trimming of leading/trailing whitespace
# -r prevents backslash interpretation
while IFS= read -r LINE; do
    # If statement inside loop: check if current line contains the keyword
    # grep -i makes the search case-insensitive
    # grep -q suppresses output (we only want the exit code)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        # Increment counter each time keyword is found
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"  # Feed the file into the while loop

# --- Print summary result ---
echo "------------------------------------------------------------"
echo "  Result Summary"
echo "------------------------------------------------------------"
echo "  Keyword '$KEYWORD' was found $COUNT time(s) in $LOGFILE"
echo ""

# --- Print the last 5 lines that contain the keyword ---
# This helps the user quickly see recent relevant entries
echo "------------------------------------------------------------"
echo "  Last 5 lines containing '$KEYWORD':"
echo "------------------------------------------------------------"

# grep -i for case-insensitive, pipe to tail to get last 5 matches
MATCHES=$(grep -i "$KEYWORD" "$LOGFILE" | tail -5)

# Check if any matches were found before printing
if [ -z "$MATCHES" ]; then
    echo "  No matching lines found."
else
    # Print each match with indentation for readability
    echo "$MATCHES" | while IFS= read -r MATCH_LINE; do
        echo "  >> $MATCH_LINE"
    done
fi

echo ""
echo "============================================================"
echo "  Analysis complete."
echo "============================================================"
