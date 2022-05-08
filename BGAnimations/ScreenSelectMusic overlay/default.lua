-- This is where the song title will be stored, as well as possibly the difficulty and modifier information.
-- stan popira janai no
local bAllowJackets = false
local sJacketPath = THEME:GetPathG("Common", "fallback jacket")

local t = Def.ActorFrame {
    -- Title
    Def.BitmapText{
    Font = ThemePrefs.Get("UIFont") or "Common Normal",
        OnCommand = function(self)
            self:maxwidth(270)
            self:zoom(0.9)
            self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+19)
        end,
        CurrentSongChangedMessageCommand=function(self)
        if GAMESTATE:GetCurrentSong() then
            local title = GAMESTATE:GetCurrentSong():GetDisplayMainTitle()
                self:settext(title)
        else
            local wheel = SCREENMAN:GetTopScreen():GetMusicWheel()
                self:settext(wheel:GetSelectedSection())
            end
        end
    },
    -- Subtitle
    Def.BitmapText{
    Font = ThemePrefs.Get("UIFont") or "Common Normal",
        OnCommand = function(self)
            self:maxwidth(270)
            self:zoom(0.5)
            self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+37)
        end,
        CurrentSongChangedMessageCommand=function(self)
            if GAMESTATE:GetCurrentSong() then
                local title = GAMESTATE:GetCurrentSong():GetDisplaySubTitle()
                self:settext(title)
            else
                self:settext("")
            end
        end
    },
    -- Artist
    Def.BitmapText{
    Font = ThemePrefs.Get("UIFont") or "Common Normal",
        OnCommand = function(self)
            self:maxwidth(270)
            self:zoom(0.6)
            self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+50)
        end,
        CurrentSongChangedMessageCommand=function(self)
            if GAMESTATE:GetCurrentSong() then
                local title = GAMESTATE:GetCurrentSong():GetDisplayArtist()
                self:settext(title)
            else
                self:settext("")
            end
        end
    },

    Def.Sprite {
		Name="Banner",
		InitCommand=function(self)
            self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y-100)
            self:scaletoclipped(220,220)
        end,
		JacketCommand=function(self)
            self:scaletoclipped(220,220)
        end,
		CurrentSongChangedMessageCommand=function(self,params)
			local Song = GAMESTATE:GetCurrentSong()
			local Course = GAMESTATE:GetCurrentCourse()
			if Song then
				if ( Song:GetJacketPath() ~=  nil ) and ( bAllowJackets ) then
					self:Load( Song:GetJacketPath() )
					:playcommand("Jacket")
				elseif ( Song:GetJacketPath() ~= nil ) then
					self:Load( Song:GetJacketPath() )
					:playcommand("Jacket")
				elseif ( Song:GetBannerPath() ~= nil ) then
					self:Load( Song:GetBannerPath() )
					:playcommand("Banner")
				else
				  self:Load( bAllowJackets and sBannerPath or sJacketPath )
				  :playcommand( bAllowJackets and "Jacket" or "Banner" )
				end
			elseif Course then
				if ( Course:GetJacketPath() ~= nil ) and ( bAllowJackets ) then
					self:Load( Course:GetJacketPath() )
					:playcommand("Jacket")
				elseif ( Course:GetBannerPath() ~= nil ) then
					self:Load( Course:GetBannerPath() )
					:playcommand("Banner")
				else
					self:Load( sJacketPath )
					:playcommand( bAllowJackets and "Jacket" or "Banner" )
				end
			else
				self:Load( sJacketPath )
				:playcommand( bAllowJackets and "Jacket" or "Banner" )
			end
		end
	}
}
return t