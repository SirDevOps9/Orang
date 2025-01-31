System Monitoring Script

This System Monitoring Script is a simple yet powerful tool for checking the health of your Linux system. It monitors key system metrics like disk usage, CPU usage, memory usage, and the top memory-consuming processes. It also generates a log file for easy reference and can send warnings when thresholds are exceeded.

Features


Disk Usage Monitoring: The script checks disk usage for all partitions and triggers a warning if the usage exceeds a specified threshold.
CPU Usage Monitoring: Displays the current CPU usage percentage.
Memory Usage Monitoring: Shows the total, used, and free memory on your system.
Top 5 Memory-Consuming Processes: Lists the top 5 processes consuming the most memory on your system.
Customizable Threshold and Log File: Allows you to set a custom disk usage threshold and specify a custom log file name.
Log Report: The script generates a detailed log report for system status, which includes disk, CPU, memory, and process information.
Real-time Monitoring: The script runs on-demand and gives real-time feedback about the system’s status.
Installation
Clone this repository or download the script.
Make sure to give execution permissions to the script:
bash
Copy
Edit
chmod +x system_monitor.sh
Install msmtp for email notifications (if using email functionality).
Usage
You can run the script with optional arguments to customize the disk usage threshold and log file name:

bash
Copy
Edit
./system_monitor.sh -t <threshold> -f <log_file>
Parameters:
-t <threshold>: Set the disk usage warning threshold (in percentage, default is 80%).
-f <log_file>: Set a custom log file name (default is system_monitor.log).
Example usage:

bash
Copy
Edit
./system_monitor.sh -t 90 -f system_status.log
This will check the system status, set the disk usage threshold to 90%, and save the results in the system_status.log file.

Sample Output
The script will output the following to both the terminal and the log file:

Disk Usage: Shows usage details for each partition. If any partition exceeds the specified threshold, a warning is triggered.
CPU Usage: Displays the current CPU usage percentage.
Memory Usage: Shows the total, used, and free memory.
Top 5 Memory-Consuming Processes: Lists the top 5 processes consuming the most memory.
Timestamp: A timestamp marking when the system check was completed.
Example Output:
text
Copy
Edit
🔍 System Monitoring Script
--------------------------
📂 Checking disk usage...
Partition: / - Usage: 40%
⚠️ WARNING: / is at 40% usage, exceeding the 80% threshold!

🔥 Checking CPU usage...
Current CPU Usage: 25.5%

💾 Checking memory usage...
Total: 16G, Used: 8.2G, Free: 7.8G

📊 Checking top 5 memory-consuming processes...
PID | Memory% | Command
----------------------------
1234 45% /usr/bin/python3
5678 30% /usr/bin/java
...
Email Notifications
If the disk usage exceeds the specified threshold, the script can send an email notification (requires proper configuration of msmtp or similar tools).

Requirements
msmtp or sendmail for email notifications
bash shell
Linux system (Ubuntu, Debian, etc.)
