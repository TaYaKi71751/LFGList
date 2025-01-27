-- This file is loaded from "LFGlist.toc"

local frame
SLASH_LFGLIST1 = "/lfglist"
SlashCmdList["LFGLIST"] = function(msg)
  if not msg or msg:trim():len()==0 then
    print("You need to provide a name for the group to form one.")
    return
  end
  if not GroupFinderFrame:IsVisible() then
    PVEFrame_ShowFrame("GroupFinderFrame")
  end
  GroupFinderFrameGroupButton3:Click()
  C_Timer.After(0.25,function()
    LFGListCategorySelection_SelectCategory(LFGListFrame.CategorySelection,6,0)
    LFGListFrame.CategorySelection.StartGroupButton:Click()
    LFGListFrame.EntryCreation.Name:SetText(msg:trim())
    C_Timer.After(0.25,function()
      LFGListFrame.EntryCreation.ListGroupButton:Click()
      frame = frame or CreateFrame("Frame")
      frame:SetScript("OnEvent",function(self)
        self:UnregisterEvent("LFG_LIST_ACTIVE_ENTRY_UPDATE")
      end)
      frame:RegisterEvent("LFG_LIST_ACTIVE_ENTRY_UPDATE")
      print(LFGListFrame)
      LFGListFrame.EntryCreation.ListGroupButton:Click()
    end)
  end)
end
