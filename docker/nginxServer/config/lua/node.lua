local http = require "resty.http";
local redis = require "nginx.redis";
local getRedisCacheTime = require "getRedisCacheTime";

local HTTP_CLIENT = http.new();

local NODE_DOCKER_URL = os.getenv('NODE_DOCKER_URL');
local REDIS_DOCKER_URL = os.getenv('REDIS_DOCKER_URL');
local REDIS_DOCKER_PORT = os.getenv('REDIS_DOCKER_PORT');
local ENABLE_REDIS_CACHE = os.getenv('ENABLE_REDIS_CACHE');

local REDIS_CLIENT = redis.new();
local IS_REDIS = nil;

if ENABLE_REDIS_CACHE == 'on' then
    local IS_REDIS_CONNECT, REDIS_CONNECT_ERROR = REDIS_CLIENT:connect(REDIS_DOCKER_URL, REDIS_DOCKER_PORT);
    if IS_REDIS_CONNECT then
        IS_REDIS = true;
    end
end

local CLIENT_URL = ngx.var.request_uri;

local API_URL = NODE_DOCKER_URL .. CLIENT_URL;

ngx.header['content-type'] = 'application/json; charset=utf-8';
ngx.header['Content-Type'] = 'application/json; charset=utf-8';

if IS_REDIS then
    local data = REDIS_CLIENT:get(CLIENT_URL);
    if data ~= ngx.null then
        ngx.status = 200;
        ngx.say(data)
        return;
    end
end

local res, err = HTTP_CLIENT:request_uri(API_URL, {
    headers = ngx.req.get_headers(),
    method = ngx.req.get_method()
});

ngx.status = res.status

if IS_REDIS and ngx.status == 200 then
    local time = getRedisCacheTime(CLIENT_URL);

    if time ~= 0 then
        REDIS_CLIENT:set(CLIENT_URL, res.body);
        REDIS_CLIENT:expire(CLIENT_URL)
    end
end

ngx.say(res.body)
