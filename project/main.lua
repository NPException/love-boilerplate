--
--
--  Created by Tilmann Hars
--  Copyright (c) 2014 Headchant. All rights reserved.
--

-- Set Library Folders
LIBRARYPATH = "libs."


-- Get the libs manually
local strict    = require( LIBRARYPATH.."strict"            )
local slam      = require( LIBRARYPATH.."slam"              )
local Gamestate = require( LIBRARYPATH.."hump.gamestate"    )

Proxy = require( LIBRARYPATH.."proxy" )
require( LIBRARYPATH.."misc"  )

-- Handle some global variables that strict.lua may (incorrectly, ofcourse) complain about:
class_commons = nil
common = nil
no_game_code = nil
NO_WIDGET   = nil
TILED_LOADER_PATH = nil

SCALE = 2
TILEWIDTH = 32
TILEHEIGHT = 32



-- some standard proxies
Image   = Proxy.create(function(k) return love.graphics.newImage('img/' .. k .. '.png') end)
Sfx     = Proxy.create(function(k) return love.audio.newSource('sfx/' .. k .. '.ogg', 'static') end)
Music   = Proxy.create(function(k) return love.audio.newSource('music/' .. k .. '.ogg', 'stream') end)

--[[ usage:
    love.graphics.draw(Image.background)
-- or    
    Sfx.explosion:play()
--]]


local function extractFileName(str)
	return string.match(str, "(.-)([^\\/]-%.?([^%.\\/]*))$")
end

-- Initialization
function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  
	math.randomseed(os.time())
	love.graphics.setDefaultFilter("nearest", "nearest")
	-- love.mouse.setVisible(false)
    -- print "Require Sources:"
	local loaded = recursiveRequire("src")
  for k,v in pairs(loaded) do
    print("loaded: "..k)
  end
	Gamestate.registerEvents()
	Gamestate.switch(Game)
end

-- Logic
function love.update( dt )
	
end

-- Rendering
function love.draw()

end

-- Input
function love.keypressed()
	
end

function love.keyreleased()
	
end

function love.mousepressed()
	
end

function love.mousereleased()
	
end

function love.joystickpressed()
	
end

function love.joystickreleased()
	
end

io.stdout:setvbuf("no")