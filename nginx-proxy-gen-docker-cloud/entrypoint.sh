echo "Fetching nginx-proxy template: https://raw.githubusercontent.com/jwilder/nginx-proxy/master/nginx.tmpl"
/usr/bin/curl https://raw.githubusercontent.com/jwilder/nginx-proxy/master/nginx.tmpl > /etc/docker-gen/templates/nginx.tmpl

echo "Using template /etc/docker-gen/templates/nginx.tmpl"
cat /etc/docker-gen/templates/nginx.tmpl

echo "Generating nginx-proxy template"
/usr/local/bin/docker-gen -notify-output -notify "./restart_service.sh" -watch -wait 10s:30s /etc/docker-gen/templates/nginx.tmpl /etc/nginx/conf.d/default.conf
