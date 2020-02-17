FROM alpine:3.11

RUN apk add --no-cache clamav clamav-libunrar nginx

COPY entrypoint.sh /sbin
COPY nginx.conf /etc/nginx

RUN mkdir /run/nginx && \
    mkdir /run/clamav && \
    touch /run/nginx/junk && \
    touch /run/clamav/junk && \
    chmod -R 0777 /run/nginx /run/clamav && \
    sed -i 's/^#Foreground .*$/Foreground yes/g' /etc/clamav/freshclam.conf && \
    sed -i 's/^#Checks .*$/Checks 24/g' /etc/clamav/freshclam.conf && \
    sed -i 's/^NotifyClamd .*$//g' /etc/clamav/freshclam.conf && \
    echo "ScriptedUpdates no" >>/etc/clamav/freshclam.conf

CMD [ "/sbin/entrypoint.sh" ]

