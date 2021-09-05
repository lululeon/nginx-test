server {
  listen ${LISTEN_PORT};
  
  location / {
    root /vol/static;
    proxy_pass http://${APP_HOST}:${APP_PORT};

    try_files $uri $uri/ @appserver;

    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
  }

  location @appserver {
    proxy_pass http://${APP_HOST}:${APP_PORT};
  }
}
