--[[
Author: Zyos
Date: 06/07/2025 DD/MM/YY
Description: Handles trails for players
]]

--Services
local ServerScriptService = game:GetService("ServerScriptService")
local ServerStorage = game:GetService("ServerStorage")

--Events

--Variables
local tStarts = {}

--Modules
local Modules = ServerScriptService.Modules

local trailService = require(Modules.trailService)

--Settings

--Main
local trailStarts = trailService:getTrailStarts()
local trailFinishes = trailService:getTrailFinishes()

for i, trailStart in ipairs(trailStarts) do
	trailStart.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChild("Humanoid") then
			local plr = game.Players:GetPlayerFromCharacter(hit.Parent)
			
			if plr:GetAttribute("checkpointCFrame") == CFrame.new(0,0,0) then plr:SetAttribute("checkpointCFrame", trailStart.CFrame) end
			trailService:setTrail(plr, trailStart.Parent:GetAttribute("trailID"), trailStart.Parent.Parent.Parent:GetAttribute("worldID"))
		end
	end)
end

for i, trailFinish in ipairs(trailFinishes) do
	trailFinish.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChild("Humanoid") then
			local plr = game.Players:GetPlayerFromCharacter(hit.Parent)
			local trail = trailFinish.Parent
			local world = trail.Parent.Parent
			
			if plr:GetAttribute("trailID") ~= trail:GetAttribute("trailID") then return end
			if plr:GetAttribute("worldID") ~= world:GetAttribute("worldID") then return end

			trailService:finishTrail(plr, trail)
		end
	end)
end