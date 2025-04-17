#! /usr/bin/bash
# This script announces the current time and repeater ID at the top of each hour.
# At any other minute, it announces only the repeater ID.
# It uses the Asterisk command line interface to send commands to the repeater.

# Log function
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

# Log script start
log_message "Script execution started"

# Get the current minute
CURRENT_MINUTE=$(date +%M)
log_message "Current minute is $CURRENT_MINUTE"

# Check if it's the top of the hour (minute is 00)
if [ "$CURRENT_MINUTE" = "00" ]; then
    log_message "Running time announcement"
    /usr/bin/sudo asterisk -rx "rpt cmd 60349 status 12 xxx"
    log_message "Time announcement completed"
fi

# Run ID of the repeater 
log_message "Running repeater ID"
/usr/bin/sudo asterisk -rx "rpt cmd 60349 status 11 xxx"
log_message "Repeater ID completed"

# Log script end
log_message "Script execution completed"
