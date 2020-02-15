#!/bin/sh

# Setup Freshclam
echo Updating Clamav
echo Enabled Freshclam config:
cat /etc/clamav/freshclam.conf | sed -e 's/#.*$//' -e '/^$/d'
freshclam
chown -R clamav:clamav /var/lib/clamav
freshclam -d &
echo Initial Database Sync completed.

echo Starting Nginx
echo Nginx Config
cat /etc/nginx/nginx.conf
exec nginx
