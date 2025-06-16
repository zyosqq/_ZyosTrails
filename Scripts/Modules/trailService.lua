--[[
Author: Zyos
Date: 06/07/2025 DD/MM/YY
Description: Module that manages trails for players
]]

--Services
local ServerStorage = game:GetService("ServerStorage")
local ServerScriptService = game:GetService("ServerScriptService")

--Events
local BindableEvents = ServerStorage.BindableEvents

local onTrailAccess = BindableEvents.onTrailAccess
local onTrailFinish = BindableEvents.onTrailFinish

--Modules
local Modules = ServerScriptService.Modules

local checkpointService = require(Modules.checkpointService)
local playerService = require(Modules.playerService)

--Variables
local worlds = game.Workspace.worlds

--Settings

--Main
local trailService = {}

function trailService:getTrailFinishes()
	local array = {}

	for i, world in ipairs(worlds:GetChildren()) do
		local trails = world:FindFirstChild("trails")
		if not trails then continue end

		for i, trail in ipairs(trails:GetChildren()) do
			local trailFinish = trailService:_checkForTrailFinish(trail)

			table.insert(array, trailFinish)
		end
	end

	return array
end

function trailService:_checkForTrailFinish(trail)
	for i, child in ipairs(trail:GetChildren()) do

		if not child:FindFirstChild("TrailFinish") or not child:FindFirstChild("TrailFinish").Value then continue end

		return(child)
	end
end

function trailService:getTrailStarts()
	local array = {}
	
	for i, world in ipairs(worlds:GetChildren()) do
		local trails = world:FindFirstChild("trails")
		if not trails then continue end
		
		for i, trail in ipairs(trails:GetChildren()) do
			local trailStart = trailService:_checkForTrailStart(trail)
			
			table.insert(array, trailStart)
		end
	end

	return array
end

function trailService:_checkForTrailStart(trail)
	for i, child in ipairs(trail:GetChildren()) do

		if not child:FindFirstChild("TrailStart") or not child:FindFirstChild("TrailStart").Value then continue end
		
		return(child)
	end
end

--Set Trail
function trailService:setTrail(plr, tID, wID)
	if plr:GetAttribute("worldID") == wID and plr:GetAttribute("trailID") == tID then return end
	
	plr:SetAttribute("trailID", tID)
	plr:SetAttribute("worldID", wID)
	onTrailAccess:Fire(plr, tID, wID)
end

--Remove Trail
function trailService:removeTrail(plr)
	plr:SetAttribute("trailID", nil)
	plr:SetAttribute("worldID", nil)
	onTrailAccess:Fire(plr, nil, nil)
end

--On Finish Trail
function trailService:finishTrail(plr, trail)
	local finishDebounce = plr.debounces.finishDebounce
	if finishDebounce.Value then return end
	finishDebounce.Value = true
	
	checkpointService:removeCheckpoints(plr)
	playerService:plrCFrameToCheckpoint(plr, trail.start.CFrame)
	onTrailFinish:Fire(plr, trail)
	
	task.spawn(function()
		task.wait(3)
		finishDebounce.Value = false
	end)
end

return trailService