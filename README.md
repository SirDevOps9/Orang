
Here's a description you can use in your GitHub README:
System Monitoring Script
A comprehensive Bash script to monitor system resources, including:
Disk usage and threshold alerts
CPU usage
Memory usage
Top 5 memory-consuming processes
Features:
Customizable disk usage threshold
Log file output with timestamp
Email notification support (configure your email address in the script)
Usage:
Clone this repository to your local machine.
Make the script executable: chmod +x system_monitor.sh
Run the script: ./system_monitor.sh
Optionally, customize the disk usage threshold and log file name using command-line arguments:
-t <threshold>: Set disk usage warning threshold (default is 80%)
-f <log_file>: Set the log file name (default is system_monitor.log)
Example Output:
The script will generate a log file with the following format:
🔍 System Monitoring Script
📂 Checking disk usage...
Partition: /dev/sda1 - Usage: 50%
Partition: /dev/sda2 - Usage: 80%
⚠️ WARNING: /dev/sda2 is at 80% usage, exceeding the 80% threshold!
🔥 Checking CPU usage...
Current CPU Usage: 20%
💾 Checking memory usage...
Total: 16G, Used: 8G, Free: 8G
📊 Checking top 5 memory-consuming processes...
PID | Memory% | Command
1234 | 10% | chrome
5678 | 8% | firefox
9012 | 6% | slack
3456 | 5% | vscode
6789 | 4% | telegram
✅ System check completed on Fri Jan 31 14:30:00 UTC 2025
