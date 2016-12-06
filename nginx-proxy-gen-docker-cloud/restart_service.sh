#!/bin/sh

echo "Generated new template:"
cat /etc/nginx/conf.d/default.conf

echo "Redeploying proxy service [${NGINX_PROXY_SERVICE}]..."
proxy=`docker-cloud service ps --status Running | grep "^${NGINX_PROXY_SERVICE}" | awk '{print $2}'`

echo "running... docker-cloud service redeploy $proxy"
docker-cloud service redeploy $proxy

echo "Redeployed proxy service [${NGINX_PROXY_SERVICE}]"
