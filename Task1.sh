#!/bin/bash

# Set the threshold percentage for warnings
THRESHOLD=80

echo "Checking disk usage..."

# Get disk usage details, skipping the first line (header)
df -h | awk 'NR>1 {print $5 " " $6}' | while read output; do
    usage=$(echo $output | awk '{print $1}' | sed 's/%//')  # Extract percentage (remove %)
    partition=$(echo $output | awk '{print $2}')  # Get partition name

    echo "Partition: $partition - Usage: $usage%"

    # Check if usage exceeds threshold
    if [ $usage -ge $THRESHOLD ]; then
        echo "⚠️ WARNING: $partition is at $usage% usage, exceeding the $THRESHOLD% threshold!"
    fi
done

echo "Disk check completed."


## Check CPU Usage ##
echo -e "\n🔥 Checking CPU usage..."
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')  # Get CPU usage percentage
echo "Current CPU Usage: $CPU_USAGE%"

echo -e "\n✅ System check completed."

## Check Memory Usage ##
echo -e "\n💾 Checking memory usage..."
MEMORY=$(free -h | awk 'NR==2 {print "Total: " $2 ", Used: " $3 ", Free: " $4}')
echo "$MEMORY"

echo -e "\n✅ System check completed."

## Check Top 5 Memory-Consuming Processes ##
echo -e "\n📊 Checking top 5 memory-consuming processes..."
echo "PID | Memory% | Command"
echo "----------------------------"
ps aux --sort=-%mem | awk 'NR<=6 {print $2, $4"%", $11}'  # Display top 5 (NR<=6, as header is included)

echo -e "\n✅ System check completed."


## Save Report with Timestamp ##
echo "🔍 System Monitoring Script" | tee -a $LOG_FILE