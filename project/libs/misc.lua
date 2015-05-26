----------------------
-- STRING FUNCTIONS --
----------------------

--[[
  returns true if this string starts with 'piece'
]]--
function string:startsWith( piece )
  return (piece == "") or (self:sub(1,piece:len()) == piece)
end
 
 --[[
  returns true if this string ends with 'piece'
]]--
function string:endsWith( piece )
  return (piece == "") or (self:sub(-piece:len()) == piece)
end

--[[
  This hash function is taken from this page: http://www.wowwiki.com/USERAPI_StringHash
  All credit goes to Mikk -> http://www.wowwiki.com/User:Mikk
]]--
function string:hash()
  local counter = 1
  local len = string.len(self)
  for i = 1, len, 3 do 
    counter = math.fmod(counter*8161, 4294967279) +  -- 2^32 - 17: Prime!
  	  (string.byte(self,i)*16776193) +
  	  ((string.byte(self,i+1) or (len-i+256))*8372226) +
  	  ((string.byte(self,i+2) or (len-i+256))*3932164)
  end
  return math.fmod(counter, 4294967291) -- 2^32 - 5: Prime (and different from the prime in the loop)
end


-----------------------
-- REQUIRE FUNCTIONS --
-----------------------

-- require all files in a folder and its subfolders, this way we do not have to require every new file
function recursiveRequire(folder, results)
  results = results or {}
  for i,file in ipairs(love.filesystem.getDirectoryItems(folder)) do
    local filename = folder.."/"..file
    if love.filesystem.isDirectory(filename) then
      recursiveRequire(filename, results)
    elseif file:endsWith(".lua") then
      local ok, result = pcall(require, filename:sub(1,filename:len()-4))
      if ok then
        results[filename] = result
      else
        print(result)
      end
    end
  end
  return results
end