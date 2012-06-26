#!/bin/sh
openssl req -new -newkey rsa:2048 -x509 -nodes -days 365 -set_serial 0 \
  -subj '/C=JP/ST=Kanagawa/L=Yokohama City/CN=*.example.com' \
  -out /etc/pki/tls/certs/wildcard.example.com.crt \
  -keyout /etc/pki/tls/private/wildcard.example.com.key
