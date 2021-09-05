#!/bin/sh

# if anything fails, return the error
set -e

# since some vars in tpl are $-prefixed, explicitly list the $vars to replace. Will grab these
# env vars from a .env with keys in `export FOO=bar` format too.
envsubst '\$LISTEN_PORT \$APP_HOST \$APP_PORT' < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf

# by default it runs as a bg daemon; in docker its best practice for the executable to run in the foreground, so:
nginx -g 'daemon off;'