LhjGameTips = class("LhjGameTips", function()
    return display.newLayer()
end)

function LhjGameTips:ctor()
    local CCSLuaNode =  requireForGameLuaFile("LhjGameTipsCCS")
    self.csNode = CCSLuaNode:create().root;
    self:addChild(self.csNode);
    
    self.pageView= tolua.cast(CustomHelper.seekNodeByName(self.csNode,"pageView"), "ccui.ListView")
    local page = ccui.ImageView:create("game_res/wz_yxgz_2.png")
     self.pageView:addChild(page)
    local closeBtn = tolua.cast(CustomHelper.seekNodeByName(self.csNode, "btn_close"), "ccui.Button")
    closeBtn:addClickEventListener(function (  )
        GameManager:getInstance():getMusicAndSoundManager():playerSoundWithFile(HallSoundConfig.Sounds.HallTouch)
        self:removeFromParent()
    end)
end
return LhjGameTips

