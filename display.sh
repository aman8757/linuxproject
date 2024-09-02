#!/bin/bash

# sysopctl version
VERSION="v0.1.0"

# Function to display help information
display_help() {
    echo "sysopctl - Command for managing system resources and tasks."
    echo
    echo "Usage: sysopctl [OPTIONS] COMMAND [ARGS]"
    echo
    echo "Options:"
    echo "  --help        Display this help message"
    echo "  --version     Show the version of sysopctl"
    echo
    echo "Commands:"
    echo "  service list                List all active services"
    echo "  service start <name>        Start a service"
    echo "  service stop <name>         Stop a service"
    echo "  system load                 Display current system load averages"
    echo "  disk usage                  Display disk usage statistics by partition"
    echo "  process monitor             Monitor system processes in real-time"
    echo "  logs analyze                Analyze recent critical log entries"
    echo "  backup <path>               Backup system files at the specified path"
}

# Function to display version information
display_version() {
    echo "sysopctl version $VERSION"
}

# Function to list running services
list_services() {
    systemctl list-units --type=service
}

# Function to start a service
start_service() {
    if [ -z "$1" ]; then
        echo "Error: No service name provided."
        exit 1
    fi
    systemctl start "$1" && echo "Service $1 started."
}

# Function to stop a service
stop_service() {
    if [ -z "$1" ]; then
        echo "Error: No service name provided."
        exit 1
    fi
    systemctl stop "$1" && echo "Service $1 stopped."
}

# Function to display system load
system_load() {
    uptime
}

# Function to check disk usage
disk_usage() {
    df -h
}

# Function to monitor system processes
process_monitor() {
    top
}

# Function to analyze system logs
logs_analyze() {
    journalctl -p 3 -xb
}

# Function to backup system files
backup_files() {
    if [ -z "$1" ]; then
        echo "Error: No backup path provided."
        exit 1
    fi
    rsync -a / "$1" && echo "Backup completed to $1."
}

# Main script logic
case "$1" in
    --help)
        display_help
        ;;
    --version)
        display_version
        ;;
    service)
        case "$2" in
            list)
                list_services
                ;;
            start)
                start_service "$3"
                ;;
            stop)
                stop_service "$3"
                ;;
            *)
                echo "Invalid service command. Use 'sysopctl --help' for usage."
                ;;
        esac
        ;;
    system)
        if [ "$2" == "load" ]; then
            system_load
        else
            echo "Invalid system command. Use 'sysopctl --help' for usage."
        fi
        ;;
    disk)
        if [ "$2" == "usage" ]; then
            disk_usage
        else
            echo "Invalid disk command. Use 'sysopctl --help' for usage."
        fi
        ;;
    process)
        if [ "$2" == "monitor" ]; then
            process_monitor
        else
            echo "Invalid process command. Use 'sysopctl --help' for usage."
        fi
        ;;
    logs)
        if [ "$2" == "analyze" ]; then
            logs_analyze
        else
            echo "Invalid logs command. Use 'sysopctl --help' for usage."
        fi
        ;;
    backup)
        backup_files "$2"
        ;;
    *)
        echo "Invalid command. Use 'sysopctl --help' for usage."
        ;;
esac

exit 0
