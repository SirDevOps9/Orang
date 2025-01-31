#!/bin/bash

# Default values
DISK_THRESHOLD=80
LOG_FILE="system_monitor.log"
EMAIL="ms1souq@gmail.com"
# Function to display usage
usage() {
    echo "Usage: $0 [-t threshold] [-f log_file]"
    echo "  -t    Set disk usage warning threshold (default is 80%)"
    echo "  -f    Set the log file name (default is system_monitor.log)"
    exit 1
}

# Parse command line arguments
while getopts "t:f:" opt; do
    case $opt in
        t) DISK_THRESHOLD=$OPTARG ;;  # Set disk threshold
        f) LOG_FILE=$OPTARG ;;        # Set log file name
        *) usage ;;                   # Invalid option
    esac
done

# Clear previous log if it exists
> $LOG_FILE

echo "🔍 System Monitoring Script" | tee -a $LOG_FILE
echo "--------------------------" | tee -a $LOG_FILE

### Check Disk Usage ###
echo "📂 Checking disk usage..." | tee -a $LOG_FILE
df -h | awk 'NR>1 {print $5 " " $6}' | while read output; do
    usage=$(echo $output | awk '{print $1}' | sed 's/%//')  # Extract percentage (remove %)
    partition=$(echo $output | awk '{print $2}')  # Get partition name

    echo "Partition: $partition - Usage: $usage%" | tee -a $LOG_FILE

    # Check if usage exceeds threshold
    if [ $usage -ge $DISK_THRESHOLD ]; then
        echo "⚠️ WARNING: $partition is at $usage% usage, exceeding the $DISK_THRESHOLD% threshold!" | tee -a $LOG_FILE
    fi
done

### Check CPU Usage ###
echo -e "\n🔥 Checking CPU usage..." | tee -a $LOG_FILE
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')  # Get CPU usage percentage
echo "Current CPU Usage: $CPU_USAGE%" | tee -a $LOG_FILE

### Check Memory Usage ###
echo -e "\n💾 Checking memory usage..." | tee -a $LOG_FILE
MEMORY=$(free -h | awk 'NR==2 {print "Total: " $2 ", Used: " $3 ", Free: " $4}')
echo "$MEMORY" | tee -a $LOG_FILE

### Check Top 5 Memory-Consuming Processes ###
echo -e "\n📊 Checking top 5 memory-consuming processes..." | tee -a $LOG_FILE
echo "PID | Memory% | Command" | tee -a $LOG_FILE
echo "----------------------------" | tee -a $LOG_FILE
ps aux --sort=-%mem | awk 'NR<=6 {print $2, $4"%", $11}' | tee -a $LOG_FILE  # Display top 5 (NR<=6, as header is included)

### Save Report with Timestamp ###
echo -e "\n✅ System check completed on $(date)" | tee -a $LOG_FILE