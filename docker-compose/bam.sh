 
#!/bin/sh

# Define the path where logs are located
LOG_PATH="/app/logs/prod"

# Define the cron job command
CRON_JOB="*/10 * * * * find $LOG_PATH -type f \( -name 'indexer.log*' -o -name 'error.log*' \) -delete"

# Add cron job to crontab
( crontab -l | grep -v -F "$CRON_JOB"; echo "$CRON_JOB" ) | crontab -

# Restart the cron service to ensure the new job is loaded
# Uncomment the line that corresponds to your container's distribution

# For Debian/Ubuntu and derivatives:
service cron restart

# For Alpine:
#/etc/init.d/crond restart

# For CentOS/RHEL and derivatives (if using cronie):
#service crond restart

echo "Cron job has been set up successfully."
