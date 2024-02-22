echo "Nginx: setting up ssl ...";
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=MA/ST=MOROCCO/L=KHOURIBGA/O=wordpress/CN=araiteb.42.fr";
echo "Nginx: ssl is set up!";