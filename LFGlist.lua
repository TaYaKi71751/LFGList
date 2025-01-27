-- This file is loaded from "LFGlist.toc"

local frame
SLASH_LFGLIST1 = "/lfglist"
SlashCmdList["LFGLIST"] = function(msg)
  if not GroupFinderFrame:IsVisible() then
    PVEFrame_ShowFrame("GroupFinderFrame")
  end
  GroupFinderFrameGroupButton3:Click()
  C_Timer.After(0.25,function()
    LFGListCategorySelection_SelectCategory(LFGListFrame.CategorySelection,6,0)
    LFGListFrame.CategorySelection.StartGroupButton:Click()
  end)
end
