-- SET REDIS VARIABLES
local REDIS_CACHE_TIME_CMS_LONG = os.getenv('REDIS_CACHE_TIME_CMS_LONG');
local REDIS_CACHE_TIME_API_LONG = os.getenv('REDIS_CACHE_TIME_API_LONG');
local REDIS_CACHE_TIME_CDN_EX = os.getenv('REDIS_CACHE_TIME_CDN_EX');
local REDIS_CACHE_PATHS_604800_EX = os.getenv('REDIS_CACHE_PATHS_604800_EX');
local REDIS_CACHE_EXCLUDE = os.getenv('REDIS_CACHE_EXCLUDE');
local REDIS_CACHE_TIME_DEFAULT = os.getenv('REDIS_CACHE_TIME_DEFAULT');

local function getRedisCacheTime(url)
    if url:match('^/cms/CommonData/CompanyData') then
        return REDIS_CACHE_TIME_CMS_LONG;
    end
    if url:match('^/cms/CommonData/HomePageData') then
        return REDIS_CACHE_TIME_CMS_LONG;
    end
    if url:match('^/api/v1/marks') then
        return REDIS_CACHE_TIME_API_LONG;
    end
    if url:match('^/api/v1/groups') then
        return REDIS_CACHE_TIME_API_LONG;
    end
    if url:match('^/cdn') then
        return REDIS_CACHE_TIME_CDN_EX;
    end

    return 0;
end

return getRedisCacheTime
