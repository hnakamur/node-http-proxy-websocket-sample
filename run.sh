#!/bin/bash
export PATH=/var/www/app/websocket-proxy-sample/node_modules/forever/bin:/usr/local/node-v0.8.1/bin:$PATH &&
BASEDIR=/var/www/app/websocket-proxy-sample

cat > $BASEDIR/router.json <<EOF
{
  "router": {
    "vhost1.example.com": "127.0.0.1:3000"
  }
}
EOF

forever \
  --plain \
  -a -l /var/log/forever.log \
  -o /var/log/node-http-proxy-out.log \
  -e /var/log/node-http-proxy-err.log \
  --pidFile /var/run/node-http-proxy.pid \
  --sourceDir $BASEDIR \
  start proxy-vhost.js
forever \
  --plain \
  -a -l /var/log/forever.log \
  -o /var/log/vhost1app-out.log \
  -e /var/log/vhost1app-err.log \
  --pidFile /var/run/VHost1App.pid \
  -w --watchDirectory $BASEDIR/VHost1App \
  --sourceDir $BASEDIR \
  start VHost1App/app.js
