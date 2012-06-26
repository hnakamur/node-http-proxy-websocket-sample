# node-http-proxy http/https -> websocket virtual host sample

## server configuration

```
                                  +---------------+
                           +------+ VHost1App/app |
                           |      | port 3000     |
     +--------------+      |      +---------------+
-----+ proxy-vhost  +------+
     | port 80, 443 |      |      +---------------+
     +--------------+      +------+ VHost2App/app |
                                  | port 3001     |
                                  +---------------+
```

* https://vhost1.example.com/ -> VHost1App/app
* https://vhost2.example.com/ -> VHost2App/app

## node modules
```
npm install socket.io -g
npm install express@2.5.10 -g
npm install ejs -g
npm install http-proxy -g
```

## See
* [５分くらいで出来るnode.js(0.6) + socket.io(0.8x)のサンプルプログラム - 大人になったら肺呼吸](http://d.hatena.ne.jp/replication/20111108/1320762287)
* [nodejitsu/node-http-proxy](https://github.com/nodejitsu/node-http-proxy)
