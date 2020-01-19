#/etc/nginx/conf.d/notes.example.com.conf

server {
    listen 80;
    server_name notes.example.com;

    location /static {
       root /var/www/notes.example.com;
    }

    location / {
        include uwsgi_params;
        uwsgi_pass unix:/var/run/uwsgi/notes.sock;
    }
}
