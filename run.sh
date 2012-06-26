#!/bin/sh
node VHost1App/app &
node VHost2App/app &
node proxy-vhost &
