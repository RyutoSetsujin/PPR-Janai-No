return Def.Quad{
    StartTransitioningCommand=function(self)
        self:FullScreen():diffuse(Color.Black)
        :diffusealpha(0):easeoutexpo(0.5):diffusealpha(1)
    end
}