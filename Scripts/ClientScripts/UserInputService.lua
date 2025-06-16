--[[
Author: Zyos
Date: 06/09/2025 DD/MM/YY
Description: Handles UserInputService for players
]]

--Services
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
--Events
local Events = ReplicatedStorage:WaitForChild("Events")
local RemoteEvents = Events:WaitForChild("RemoteEvents")

local rOnKeyboard = RemoteEvents:WaitForChild("rOnKeyboard")


--Variables
local player = game.Players.LocalPlayer

--Main
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.R then
		print("fire R")
		rOnKeyboard:FireServer()
	end
end)