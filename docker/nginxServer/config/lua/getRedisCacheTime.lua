-- SET REDIS VARIABLES
local REDIS_CACHE_TIME_API_SHORT = os.getenv('REDIS_CACHE_TIME_API_SHORT');

local function getRedisCacheTime(url)
    if url:match('^/posts/generate') then
        return 0;
    end
    if url:match('^/posts') then
        return REDIS_CACHE_TIME_API_SHORT;
    end

    return 0;
end

return getRedisCacheTime
