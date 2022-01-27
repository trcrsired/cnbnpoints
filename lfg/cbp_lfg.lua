local cnbnpoints = LibStub("AceAddon-3.0"):GetAddon("cnbnpoints")

local function cofunc(activityID,info)
	local info = C_LFGList.GetActiveEntryInfo()
	if info == nil then
		return
	end
	if IsInGroup("player") and not UnitIsGroupLeader("player") then
		return
	end
	if info.privateGroupo then
		return
	end
	local classid = select(3,UnitClass("player"))
	local EntryCreation = LFGListFrame.EntryCreation
	cnbnpoints.send_awaits(nil,"SEI",UnitGUID('player'),nil,cnbnpoints.constant2,activityID,0,nil,nil,
		EntryCreation.Name:GetText().." "..EntryCreation.Description.EditBox:GetText().." "..EntryCreation.VoiceChat.EditBox:GetText(),
		info.requiredItemLevel or 0,nil,classid)
end

function cnbnpoints:LFG_LIST_OR_UPDATE()
	coroutine.wrap(cofunc)()
end

cnbnpoints:RegisterMessage("LFG_LIST_OR_UPDATE")
