--[[
Author: Zyos
Date: 06/07/2025 DD/MM/YY
Description: Module that manages ZXP
]]

--Settings
local XP_MULTIPLIER = 1.2
local BASE_XP = 100

--Main
local zxpService = {}

-- Check LevelUp
function zxpService:checkLevelUp(player)
	local stats = player:FindFirstChild("invisiblestats")
	if not stats then return end

	local zxp = stats:FindFirstChild("zxp")
	local zxpLevelUp = stats:FindFirstChild("zxpLevelUp")
	local level = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Level")

	if not (zxp and zxpLevelUp and level) then return end

	while zxp.Value >= zxpLevelUp.Value do
		zxp.Value -= zxpLevelUp.Value
		level.Value += 1
		zxpLevelUp.Value = math.floor(BASE_XP * (XP_MULTIPLIER ^ (level.Value - 1)))
	end
end

--Add XP
function zxpService:addZXP(player, amount)
	local stats = player:FindFirstChild("invisiblestats")
	if not stats then return end

	local zxp = stats:FindFirstChild("zxp")
	if not zxp then return end

	zxp.Value += amount

	--Check LevelUp
	self:checkLevelUp(player)
end


--Initialize Player
function zxpService:initPlayer(player)
	local stats = player:WaitForChild("invisiblestats")
	if not stats then return end

	local zxpLevelUp = stats:WaitForChild("zxpLevelUp")
	local level = player:WaitForChild("leaderstats") and player.leaderstats:WaitForChild("Level")
	
	if not (zxpLevelUp and level) then return end

	zxpLevelUp.Value = math.floor(BASE_XP * (XP_MULTIPLIER ^ (level.Value - 1)))
	
	self:checkLevelUp(player)
end

return zxpService