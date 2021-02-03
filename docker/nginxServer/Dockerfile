FROM nginx:latest

RUN apt-get update
#RUN apt-get install wget nginx-extras lua-nginx-redis redis-tools -y

RUN apt-get install build-essential libreadline-dev wget curl unzip lua-nginx-redis redis-tools luarocks lua5.3 -y

#RUN curl -R -O http://www.lua.org/ftp/lua-5.3.4.tar.gz
#RUN tar -zxf lua-5.3.4.tar.gz
#RUN cd lua-5.3.4 && make linux test && make install

# Remove default config files
RUN rm -rf /etc/nginx/sites-available && rm -rf /etc/nginx/sites-enabled && rm /etc/nginx/nginx.conf

#RUN wget https://luarocks.org/releases/luarocks-3.3.0.tar.gz
#RUN tar zxpf luarocks-3.3.0.tar.gz
#RUN cd luarocks-3.3.0 && ./configure && make && make install
RUN luarocks install lua-resty-http


# Expose port 80
EXPOSE 80
