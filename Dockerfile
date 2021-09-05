FROM nginxinc/nginx-unprivileged:1-alpine

COPY ./default.conf.tpl /etc/nginx/default.conf.tpl

ENV LISTEN_PORT=8000
ENV APP_HOST=localhost
ENV APP_PORT=3000
ENV STATICS_DEST=/home/lululeon/data/static/idbl

USER root

RUN mkdir -p /vol/static
RUN chmod 755 /vol/static

RUN mkdir -p /usr/local/proxytest
RUN chmod 755 /usr/local/proxytest

RUN touch /etc/nginx/conf.d/default.conf
RUN chown nginx:nginx /etc/nginx/conf.d/default.conf

COPY ./entrypoint.sh /usr/local/proxytest/entrypoint.sh
RUN chmod +x /usr/local/proxytest/entrypoint.sh

USER nginx

CMD ["/usr/local/proxytest/entrypoint.sh"]
