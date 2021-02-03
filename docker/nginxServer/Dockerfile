FROM nginx:latest

RUN apt-get update

RUN apt-get install build-essential libreadline-dev wget curl unzip lua-nginx-redis redis-tools luarocks lua5.3 -y


# Remove default config files
RUN rm -rf /etc/nginx/sites-available && rm -rf /etc/nginx/sites-enabled && rm /etc/nginx/nginx.conf

RUN luarocks install lua-resty-http


# Expose port 80
EXPOSE 80
