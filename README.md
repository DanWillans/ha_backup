## Home Assistant backup script

This repository hosts the necessary things to backup a local home assistant configuration when using docker.

1. Setup a cronjob that runs the backup script with `sudo crontab -e`. Sudo is required for writing to logs and also backing up authentication files inside the home assistant config directory.

e.g.
```
# Backup every day at 2 
0 2 * * * /home/<HOSTNAME>/devel/ha_backup/backup.sh >> /var/log/ha_backup.log 2>&1
```

2. Use something like duplicity to create an external sync for the backups.
