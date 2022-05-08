return Def.ActorFrame{
    LifeChangedMessageCommand=function(self, params)
        if params.Player == pn then
            local LifeAmount = params.LifeMeter:GetLife()
        end
    end
}