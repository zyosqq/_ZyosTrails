--[[
Author: Zyos
Date: 06/09/2025 DD/MM/YY
Description: Resets the player to his checkpoint
]]

-- Services
local ServerScriptService = game:WaitForChild("ServerScriptService")
local ReplicatedStorage = game:WaitForChild("ReplicatedStorage")
local Players = game:GetService("Players")

--Events
local Events = ReplicatedStorage:WaitForChild("Events")
local RemoteEvents = Events:WaitForChild("RemoteEvents")

local rOnKeyboard = RemoteEvents:WaitForChild("rOnKeyboard")

--Modules
local Modules = ServerScriptService:WaitForChild("Modules")

local checkpointService = require(Modules:WaitForChild("checkpointService"))

--Main
local playerService = {}

--Sets the player's CFrame to the checkpoints CFrame
function playerService:plrCFrameToCheckpoint(plr, _CFrame)
	if _CFrame then
		plr.Character:PivotTo(_CFrame * CFrame.new(0,5,0))
		return
	end
	
	local checkpointCFrame = plr:GetAttribute("checkpointCFrame")
	if not checkpointCFrame then return end

	plr.Character:PivotTo(checkpointCFrame * CFrame.new(0,5,0))
end

return playerService
