local Proxy = {}

-- Creates a proxy via rawset.
-- Credit goes to vrld: https://github.com/vrld/Princess/blob/master/main.lua
-- easier, faster access and caching of resources like images and sound
-- or on demand resource loading
function Proxy.create(loadFunction)
  local proxyMeta = {
    __index = function(self, key)
      local value = loadFunction(key)
      rawset(self, key, value)
      return value
    end
  }
	return setmetatable({}, proxyMeta)
end

return Proxy