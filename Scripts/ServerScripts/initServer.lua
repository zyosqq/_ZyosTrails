--[[
Author: Zyos
Date: 06/07/2025 DD/MM/YY
Description: Initializes the server
]]

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local Players = game:GetService("Players")

--Events
local Events = ReplicatedStorage.Events
local RemoteEvents = Events.RemoteEvents

--Modules
local Modules = ServerScriptService.Modules

local dataService = require(Modules.dataService)
local zxpService = require(Modules.zxpService)
local zcoinsService = require(Modules.zcoinsService)
local trailService = require(Modules.trailService)
local checkpontService = require(Modules.checkpointService)

--Variables
--Settings

--Main

--Datastore
Players.PlayerAdded:Connect(function(plr)
	dataService:initPlayer(plr)
end)

Players.PlayerRemoving:Connect(function(plr)
	dataService.dataSave(plr)
end)

game:BindToClose(function()
	for i,v in pairs(game.Players:GetPlayers()) do
		dataService.dataSave(v)
	end
end)

task.spawn(function()
	while true do
		task.wait(60)
		for _, plr in pairs(game.Players:GetPlayers()) do
			dataService.dataSave(plr)
		end
	end
end)

--ZXP
Players.PlayerAdded:Connect(function(plr)
	zxpService:initPlayer(plr)
end)

--checkpoints
Players.PlayerAdded:Connect(function(plr)
	checkpontService:initPlayer(plr)
end)