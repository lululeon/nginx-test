#!/bin/sh

# if anything fails, return the error
set -e

envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf

# by default it runs as a bg daeman; in docker its best practice for the executable to run in the foreground, so:
nginx -g 'daemon off;'