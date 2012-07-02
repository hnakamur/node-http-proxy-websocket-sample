var fs = require('fs'),
    httpProxy = require('http-proxy')

var routerFile = __dirname + '/router.json';

// http proxy
var httpOptions = {
  router: routerFile
}
var server = httpProxy.createServer(httpOptions)
server.listen(80)

// https proxy
var httpsOptions = {
  router: routerFile,
  https: {
    key: fs.readFileSync('/etc/pki/tls/private/wildcard.example.com.key', 'utf8'),
    cert: fs.readFileSync('/etc/pki/tls/certs/wildcard.example.com.crt', 'utf8')
  }
}
var server = httpProxy.createServer(httpsOptions)
server.listen(443)
