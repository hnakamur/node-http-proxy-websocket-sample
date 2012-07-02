#!/bin/bash
export PATH=/var/www/app/websocket-proxy-sample/node_modules/forever/bin:/usr/local/node-v0.8.1/bin:$PATH &&
BASEDIR=/var/www/app/websocket-proxy-sample


forever \
  --plain \
  -a -l /var/log/forever.log \
  -o /var/log/vhost2app-out.log \
  -e /var/log/vhost2app-err.log \
  --pidFile /var/run/VHost2App.pid \
  -w --watchDirectory $BASEDIR/VHost2App \
  --sourceDir $BASEDIR \
  start VHost2App/app.js

cat > $BASEDIR/router.json <<EOF
{
  "router": {
    "vhost1.example.com": "127.0.0.1:3000",
    "vhost2.example.com": "127.0.0.1:3001"
  }
}
EOF
