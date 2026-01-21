#!/bin/bash
docker run -d --restart always --name nginx-d -p 80:80
docker copy nginx-d:/etc/nginx /home/db
docker stop nginx-d
docker rm nginx-d
docker run -d --restart always --name nginx-d -p 80:80 -p 443:443 -v /var/www/html:/usr/share/nginx/html -v /home/db/nginx:/etc/nginx -v /home/db/log:/log nginx-d