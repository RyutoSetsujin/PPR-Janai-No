return Def.Sprite {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	OnCommand=function(self)
		if GAMESTATE:GetCurrentSong():GetBackgroundPath() then
			self:visible(true);
			self:LoadBackground(GAMESTATE:GetCurrentSong():GetBackgroundPath());
			self:stretchto(0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
		end;
	end;
};