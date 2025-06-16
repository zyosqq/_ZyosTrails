--[[
Author: Zyos
Date: 13/06/2025 DD/MM/YY
Description: Template for a script.
]]

--Services
local ServerScriptService = game.ServerScriptService
local ServerStorage = game.ServerStorage

--Events
local BindableEvents = ServerStorage.BindableEvents

local onTrailFinish = BindableEvents.onTrailFinish

--Modules
local Modules = ServerScriptService.Modules

local zcoinsService = require(Modules.zcoinsService)
local zxpService = require(Modules.zxpService)

--Variables
--Settings

onTrailFinish.Event:Connect(function(plr, trail)
	local info = trail.info
	
	local name = info.name.Value
	local zxp = info.zxp.Value
	local zcoins = info.zcoins.Value
	
	zxpService:addZXP(plr, zxp)
	zcoinsService:addZCOINS(plr, zcoins)
end)