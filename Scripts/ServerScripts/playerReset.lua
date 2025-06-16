--[[
Author: Zyos
Date: 06/09/2025 DD/MM/YY
Description: Handles the player reset
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

local playerService = require(Modules:WaitForChild("playerService"))

--Main
rOnKeyboard.OnServerEvent:Connect(function(plr)
	playerService:plrCFrameToCheckpoint(plr)
end)