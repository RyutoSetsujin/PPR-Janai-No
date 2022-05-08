local t = Def.ActorFrame{
    LoadActor("thing")..{
        InitCommand=cmd(FullScreen);
    };

    Def.BitmapText {
        Name = 'BPM',
        Font = 'Common Normal',
        InitCommand = function(self)
            self
                :addy(-8)
                :horizalign('left')
        end,
        OnCommand = function(self)
            local bpmstr = 'BPM: '
            local song = GAMESTATE:GetCurrentSong()
            if song then
                -- check if the bpm is hidden -y0sefu
                if song:IsDisplayBpmRandom() then
                    self:settext('BPM: ???') -- The spaces seemed a bit unnecessary to me. ~Sudo
                    -- return early -y0sefu
                    return
                end

                local minBPM = math.floor(song:GetDisplayBpms()[1])
                local maxBPM = math.floor(song:GetDisplayBpms()[2])

                if minBPM == maxBPM then
                    bpmstr = bpmstr .. math.floor(song:GetDisplayBpms()[2])
                else
                    bpmstr = bpmstr .. minBPM .. ' - ' .. maxBPM
                end
            else
                --bpmstr = bpmstr .. '--'
                bpmstr = ''
            end
            self:settext(bpmstr)
        end,
        CurrentSongChangedMessageCommand = function(self)
            local bpmstr = 'BPM: '
            local song = GAMESTATE:GetCurrentSong()
            if song then
                -- check if the bpm is hidden -y0sefu
                if song:IsDisplayBpmRandom() then
                    self:settext('BPM: ???') -- The spaces seemed a bit unnecessary to me. ~Sudo
                    -- return early -y0sefu
                    return
                end

                local minBPM = math.floor(song:GetDisplayBpms()[1])
                local maxBPM = math.floor(song:GetDisplayBpms()[2])

                if minBPM == maxBPM then
                    bpmstr = bpmstr .. math.floor(song:GetDisplayBpms()[2])
                else
                    bpmstr = bpmstr .. minBPM .. ' - ' .. maxBPM
                end
            else
                --bpmstr = bpmstr .. '--'
                bpmstr = ''
            end
            self:settext(bpmstr)
        end,
    },
    
};
return t;