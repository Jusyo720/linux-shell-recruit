#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: -bash FILE"
    exit 1
fi

LOG_FILE="$1"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File not found."
    exit 1
fi

total_errors=$(grep -c "ERROR" "$LOG_FILE")
echo "Total ERROR: $total_errors"

top_code=$(grep "ERROR" "$LOG_FILE" | tr -d "[]" | awk "{print \$4}" | sort | uniq -c | sort -nr | head -n 1 | awk "{print \$2}")
echo "Top Code: $top_code"

exit 0