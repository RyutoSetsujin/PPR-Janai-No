-- Show the folder jacket period. I shit you not. finally. jackets everywhere.
-- that's right get fucked uhhh........ buzz lightyear?? i forgor💀 who said that

local t = Def.ActorFrame{}
local sJacketPath = THEME:GetPathG("Common", "fallback jacket")

t[#t+1] = Def.Sprite{
	InitCommand=function(self)
		-- Setup the initial set for the image itself.
	end,
	SetCommand=function(self,params)
		local group = params.Text
		local BannerPath = SONGMAN:GetSongGroupBannerPath(group)
		--lua.ReportScriptError( tostring(BannerPath) )
		-- Check that the group is not missing.
		if BannerPath ~= "" then
			self:Load( BannerPath )
		else
			self:Load( sJacketPath )
		end
		self:scaletoclipped(92,92)
	end
}

return t