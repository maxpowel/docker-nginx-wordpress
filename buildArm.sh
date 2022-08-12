docker buildx build --platform linux/amd64,linux/arm64 -t "wordpress-arm" .
docker tag wordpress-arm maxpowel/nginx-wordpress:latest
docker push maxpowel/nginx-wordpress:latest

