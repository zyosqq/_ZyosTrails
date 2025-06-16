--[[
Author: Zyos
Date: 06/07/2025 DD/MM/YY
Description: Module that manages ZCoins
]]

--Main
local zcoinsService = {}

--Add ZCOINS
function zcoinsService:addZCOINS(plr, amount)
	local stats = plr:FindFirstChild("leaderstats")
	if not stats then return end

	local zcoins = stats:FindFirstChild("ZCoins")
	if not zcoins then return end

	zcoins.Value += amount
end

--Remove ZCOINS
function zcoinsService:removeZCOINS(plr, amount)
	local stats = plr:FindFirstChild("leaderstats")
	if not stats then return end

	local zcoins = stats:FindFirstChild("ZCoins")
	if not zcoins then return end

	if zcoins.Value < amount then return end
	
	zcoins.Value -= amount
end

--Get ZCOINS
function zcoinsService:getZCOINS(plr)
	local stats = plr:FindFirstChild("leaderstats")
	if not stats then return end

	local zcoins = stats:FindFirstChild("ZCoins")
	if not zcoins then return end

	return(zcoins.Value)
end

return zcoinsService
