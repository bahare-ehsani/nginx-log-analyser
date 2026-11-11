#!/usr/bin/env bash

# Nginx Log Analyser
# Analyse Nginx access logs and display the top 5 results.

set -o nounset
set -o pipefail

# Determine the directory where the script is located.
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Define the input log file.
LOG_FILE="${1:-$SCRIPT_DIR/nginx-access.log}"

# Validate the input file.
if [[ ! -f "$LOG_FILE" ]]; then
    echo "Error: Log file does not exist: $LOG_FILE" >&2
    exit 1
fi

if [[ ! -r "$LOG_FILE" ]]; then
    echo "Error: Log file is not readable: $LOG_FILE" >&2
    exit 1
fi

# Display the top 5 IP addresses.
echo
echo "Top 5 IP Addresses:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5

# Display the top 5 requested paths.
echo
echo "Top 5 Requested Paths:"
awk -F '"' '{split($2, request, " "); print request[2]}' "$LOG_FILE" \
    | sort | uniq -c | sort -nr | head -n 5

# Display the top 5 HTTP status codes.
echo
echo "Top 5 HTTP Status Codes:"
awk -F '"' '{print $3}' "$LOG_FILE" \
    | awk '{print $1}' \
    | sort | uniq -c | sort -nr | head -n 5

# Display the top 5 User Agents.
echo
echo "Top 5 User Agents:"
awk -F '"' '{print $6}' "$LOG_FILE" \
    | sort | uniq -c | sort -nr | head -n 5
