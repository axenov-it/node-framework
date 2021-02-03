local http = require "resty.http";
local HTTP_CLIENT = http.new();
local NODE_DOCKER_URL = os.getenv('NODE_DOCKER_URL');

local API_URL = NODE_DOCKER_URL .. ngx.var.request_uri;

local res, err = HTTP_CLIENT:request_uri(API_URL, {
    headers = ngx.req.get_headers(),
    method = ngx.req.get_method()
});

for i, value in pairs(res.headers) do
    ngx.header[i] = value;
end

ngx.status = res.status;

ngx.say(res.body);
