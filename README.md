sysopctl Documentation 
Overview 
sysopctl is a command-line utility designed for managing and monitoring system resources and tasks. 
It provides a variety of functionalities, such as managing services, checking system load, monitoring 
processes, analyzing logs, and performing backups. 
Usage 
bash 
Copy code 
sysopctl [OPTIONS] COMMAND [ARGS] 
Options --help 
Display the help message. --version 
Show the version of sysopctl. 
Commands 
service 
service list 
List all active services. Utilizes systemctl list-units --type=service to display the currently running 
services. 
service start <name> 
Start a specified service. Replace <name> with the name of the service you want to start. This 
command uses systemctl start <name>. 
service stop <name> 
Stop a specified service. Replace <name> with the name of the service you want to stop. This 
command uses systemctl stop <name>. 
system 
system load 
Display the current system load averages. This command utilizes uptime to show system load 
information. 
disk 
disk usage 
Display disk usage statistics by partition. This command uses df -h to present disk usage in a human
readable format. 
process 
process monitor 
Monitor system processes in real-time. This command launches top, which provides an overview of 
system processes and their resource usage. 
logs 
logs analyze 
Analyze recent critical log entries. This command utilizes journalctl -p 3 -xb to filter and display recent 
log entries with a priority level of 3 (errors). 
backup 
backup <path> 
Backup system files to the specified path. Replace <path> with the destination path for the backup. 
This command uses rsync -a / <path> to perform the backup. 
Examples 
To list all active services: 
bash 
Copy code 
sysopctl service list 
To start a service named apache2: 
bash 
Copy code 
sysopctl service start apache2 
To stop a service named mysql: 
bash 
Copy code 
sysopctl service stop mysql 
To display the current system load: 
bash 
Copy code 
sysopctl system load 
To check disk usage: 
bash 
Copy code 
sysopctl disk usage 
To monitor system processes: 
bash 
Copy code 
sysopctl process monitor 
To analyze recent critical log entries: 
bash 
Copy code 
sysopctl logs analyze 
To backup system files to /backup: 
bash 
Copy code 
sysopctl backup /backup 
Error Handling 
If a required argument is missing or incorrect, the script will display an error message and exit with a 
status code of 1. 
For invalid commands or arguments, the script will suggest using sysopctl --help for proper usage. 
Version 
Current version: v0.1.0 
For further information or updates, please refer to the script’s help message or contact the 
maintainer. 
