--[[
Author: Zyos
Date: 06/08/2025 DD/MM/YY
Description: Handles checkpoints for players
]]

-- Services
local ServerScriptService = game:GetService("ServerScriptService")
local ServerStorage = game:GetService("ServerStorage")

--Modules
local Modules = ServerScriptService.Modules
local checkpointService = require(Modules.checkpointService)

--Events
local BindableEvents = ServerStorage.BindableEvents

local onTrailAccess = BindableEvents.onTrailAccess

-- State
local plrConnections = {}

-- Listens for checkpoint touches and connects them
local function setupCheckpointListeners(plr, checkpoints)
	for _, checkpoint in ipairs(checkpoints) do
		local conn = checkpoint.Touched:Connect(function()
			checkpointService:setCheckpoint(plr, checkpoint)
		end)
		table.insert(plrConnections[plr], conn)
	end
end

-- Event: Player accesses a trail
onTrailAccess.Event:Connect(function(plr, tID, wID)
	-- Disconnect old listeners
	if plrConnections[plr] then
		for _, conn in ipairs(plrConnections[plr]) do
			conn:Disconnect()
		end
	end
	plrConnections[plr] = {}

	if not tID or not wID then return end

	local checkpoints, start = checkpointService:getCheckpoints(tID, wID)
	if checkpoints then
		setupCheckpointListeners(plr, checkpoints)
	end
end)

