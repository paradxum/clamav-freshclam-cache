# clamav-freshclam-cache
This image simply runs freshclam and publishs the cvd files as a root website on port 80

This is great if you are running a cluster, or multiple machines and want to use #2 from https://www.clamav.net/documents/private-local-mirrors

To configure clients to use it, in freshclam.conf set:
PrivateMirror http://**this pod/host name**:**exposed port**
ScriptedUpdates no

## Sample docker line
docker run --port 8085:80 -d ericschultz/clamav-freshclam-cache:latest
# clamav-freshclam-cache
