var fs = require('fs'),
    httpProxy = require('http-proxy')

// routing
var router = {
  'vhost1.example.com': '127.0.0.1:3000',
  'vhost2.example.com': '127.0.0.1:3001'
}

// http proxy
var httpOptions = {
  router: router
}
var server = httpProxy.createServer(httpOptions)
server.listen(80)

// https proxy
var httpsOptions = {
  router: router,
  https: {
    key: fs.readFileSync('/etc/pki/tls/private/wildcard.example.com.key', 'utf8'),
    cert: fs.readFileSync('/etc/pki/tls/certs/wildcard.example.com.crt', 'utf8')
  }
}
var server = httpProxy.createServer(httpsOptions)
server.listen(443)
