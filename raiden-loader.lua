--[[
  _____       _     _            
 |  __ \     (_)   | |           
 | |__) |__ _ _  __| | ___ _ __  
 |  _  // _` | |/ _` |/ _ \ '_ \ 
 | | \ \ (_| | | (_| |  __/ | | |
 |_|  \_\__,_|_|\__,_|\___|_| |_|

 ]]

local MarketplaceService = game:GetService("MarketplaceService")
local gameInfo = MarketplaceService:GetProductInfo(game.PlaceId)
local gameName = gameInfo.Name:lower()

if gameName:find("rivals") then
    local executor = (identifyexecutor and identifyexecutor()) or "Unknown"
    local executor_lower = executor:lower()
    if executor_lower:find("xeno") or executor_lower:find("jjsploit") or executor_lower:find("drift") or executor_lower:find("solara") then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dimzan-67/Raiden/refs/heads/main/raiden-rivals-external.lua"))()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dimzan-67/Raiden/refs/heads/main/raiden-rivals.lua"))()
    end
elseif gameName:find("escape tsunami for brainrots") then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dimzan-67/Raiden/refs/heads/main/raiden-etfb.lua"))()
end
