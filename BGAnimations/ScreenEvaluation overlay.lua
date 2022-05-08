-- ITS A HACKJOB!
-- I cant theme for shit -Jousway

-- I used some code from other themes, mostly the default theme, so massive respect to the creators

local gradescore = {
	["Grade_Tier01"] = "S",
	["Grade_Tier02"] = "AAA",
	["Grade_Tier03"] = "AA",
	["Grade_Tier04"] = "A",
	["Grade_Tier05"] = "B",
	["Grade_Tier06"] = "C",
	["Grade_Tier07"] = "D",
	["Grade_Tier08"] = "E",
	["Grade_Failed"] = "F",
}

function gradeHuman(player)
	if GAMESTATE:GetCurrentSong() then
		local steps = GAMESTATE:GetCurrentSteps(player)
		if steps then
			if STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetGrade() then
				return gradescore[STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetGrade()]
			else
				return ""
			end
		else
			return ""
		end
	else 
		return ""
	end
end

function TNS(pn,score)
	return STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetTapNoteScores(score);
end;
function HNS(pn,score)
	return STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetHoldNoteScores(score);
end;

local t = Def.ActorFrame {	
	OnCommand=function(self) self:sleep(0.0000001) self:queuecommand("Fix") self:sleep(0.0000001) self:queuecommand("Fix") end;
	FixCommand=function(self) ScreenEvalUpdate(self) end;
	--CDTitle Resizer/Container
	Def.ActorFrame{
		Name="Container";
		--SCREEN_CENTER_X-160
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		--main background
		Def.Quad{
			InitCommand=cmd(y,-2;zoomto,294*2,460;diffuse,color("0.5,0.5,0.5,0.5"));
		};
		--banner and title container
		Def.Quad{
			InitCommand=cmd(y,-155;zoomto,289,150;diffuse,color("0,0,0,0.5"));
		};
		--Banner Background
		Def.Quad{
			InitCommand=cmd(y,-160;zoomto,284,89;diffuse,color("0,0,0,0.5"););
		};
		--No Banner Text
		LoadFont("Common Normal") .. {
			Text="No Banner";
			InitCommand=cmd(y,-160;diffuse,color("1,1,1,0.5"));
		};
		--Load Banner
		Def.Sprite {
			Name="Banner";
			InitCommand=cmd(y,-160);
		};
		--Song Title above Banner
		LoadFont("Common Normal") .. {
			Name="title";
			InitCommand=cmd(y,-218;zoom,0.6;maxwidth,460);
		};
				
		--NPS Calculator/Display
		LoadFont("Common Normal") .. {
			Text="NPS";
			InitCommand=cmd(x,70;y,-98;zoom,0.75;diffuse,1,1,1,1);
		};
		LoadFont("Common Normal") .. {
			Name="P1NPS";
			InitCommand=cmd(y,-98;zoom,0.75;diffuse,color("#ef403d"));
		};
		LoadFont("Common Normal") .. {
			Name="P2NPS";
			InitCommand=cmd(y,-98;zoom,0.75;diffuse,color("#0089cf"));
		};
		
		--BPM 
		LoadFont("Common Normal") .. {
			Text="BPM";
			InitCommand=cmd(x,-25;y,-98;zoom,0.75;diffuse,1,1,1,1);
		};
		LoadFont("Common Normal") .. {
			Name="BPM";
			InitCommand=cmd(x,25;y,-98;zoom,0.75;diffuse,color("#0089cf"));
		};
		
		--Song Length
		LoadFont("Common Normal") .. {
			Name="length";
			InitCommand=cmd(x,-95;y,-98;zoom,0.75;diffuse,color("#ef403d"));
		};
		
		--Player 1 Score
		--Name bg
		Def.Quad{
			InitCommand=cmd(x,-218;y,-155;zoomto,140,40;diffuse,color("0,0,0,0.5"));
		};
		--name
		LoadFont("Common Normal") .. {
			Text=PROFILEMAN:GetProfile(PLAYER_1):GetDisplayName();
			InitCommand=cmd(x,-218;y,-155;maxwidth,138);
		};
		Def.ActorFrame{
			InitCommand=cmd(x,-146;y,74);
			--background
			Def.Quad{
				InitCommand=cmd(zoomto,289,300;diffuse,color("0,0,0,0.5"));
			};
			--W Names
			LoadFont("Common Normal") .. {
				Text="JUST COOL:\nCOOL:\nGREAT:\nGOOD:\nBAD:\nMISS:\nMINES HIT:\nHELD:\nDROPPED:";
				InitCommand=cmd(x,-130;y,0;zoom,0.6;halign,0);
			};
			--W Points
			LoadFont("Common Normal") .. {
				Text=TNS(PLAYER_1,"TapNoteScore_W1").."\n"..
				TNS(PLAYER_1,"TapNoteScore_W2").."\n"..
				TNS(PLAYER_1,"TapNoteScore_W3").."\n"..
				TNS(PLAYER_1,"TapNoteScore_W4").."\n"..
				TNS(PLAYER_1,"TapNoteScore_W5").."\n"..
				TNS(PLAYER_1,"TapNoteScore_Miss").."\n"..
				TNS(PLAYER_1,"TapNoteScore_HitMine").."\n"..
				HNS(PLAYER_1,"HoldNoteScore_Held").."\n"..
				HNS(PLAYER_1,"HoldNoteScore_LetGo");
				InitCommand=cmd(x,130;zoom,0.6;halign,1);
			};
			--Precent Score
			LoadFont("Common Normal") .. {
				Text=string.format("%03.2f",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetPercentDancePoints()*100).."%";
				InitCommand=cmd(y,120);
			};
			LoadFont("Common Normal") .. {
				Text=gradeHuman(PLAYER_1);
				InitCommand=cmd(y,105;x,-95;zoom,1.5);
			};
		};
		--Player 2 Score
		--Name bg
		Def.Quad{
			InitCommand=cmd(x,218;y,-155;zoomto,140,40;diffuse,color("0,0,0,0.5"));
		};
		--name
		LoadFont("Common Normal") .. {
			Text=PROFILEMAN:GetProfile(PLAYER_2):GetDisplayName();
			InitCommand=cmd(x,218;y,-155;maxwidth,138);
		};
		Def.ActorFrame{
			InitCommand=cmd(x,146;y,74);
			--background
			Def.Quad{
				InitCommand=cmd(zoomto,289,300;diffuse,color("0,0,0,0.5"));
			};
			--W Names
			LoadFont("Common Normal") .. {
				Text="Marvelous:\nPerfect:\nGreat:\nGood:\nBad:\nMiss:\nMines Hit:\nHolds Held:\nHolds Miss:";
				InitCommand=cmd(x,-130;y,0;zoom,0.6;halign,0);
			};
			--W Points
			LoadFont("Common Normal") .. {
				Text=TNS(PLAYER_2,"TapNoteScore_W1").."\n"..
				TNS(PLAYER_2,"TapNoteScore_W2").."\n"..
				TNS(PLAYER_2,"TapNoteScore_W3").."\n"..
				TNS(PLAYER_2,"TapNoteScore_W4").."\n"..
				TNS(PLAYER_2,"TapNoteScore_W5").."\n"..
				TNS(PLAYER_2,"TapNoteScore_Miss").."\n"..
				TNS(PLAYER_2,"TapNoteScore_HitMine").."\n"..
				HNS(PLAYER_2,"HoldNoteScore_Held").."\n"..
				HNS(PLAYER_2,"HoldNoteScore_LetGo");
				InitCommand=cmd(x,130;zoom,0.6;halign,1);
			};
			--Precent Score
			LoadFont("Common Normal") .. {
				Text=string.format("%03.2f",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetPercentDancePoints()*100).."%";
				InitCommand=cmd(y,120);
			};
			LoadFont("Common Normal") .. {
				Text=gradeHuman(PLAYER_2);
				InitCommand=cmd(y,105;x,95;zoom,1.5);
			};
		};
		
		--life and judgement
		LoadFont("Common Normal") .. {
			Text="Timing Difficulty: "..GetTimingDifficulty();
			InitCommand=cmd(zoom,0.6;y,-65;x,-146);
		};
		LoadFont("Common Normal") .. {
			Text="Life Difficulty: "..GetLifeDifficulty();
			InitCommand=cmd(zoom,0.6;y,-65;x,146);
		};
		
		--Player Settings
		LoadFont("Common Normal") .. {
			Text=GAMESTATE:GetPlayerState(PLAYER_1):GetPlayerOptionsString("ModsLevel_Preferred");
			InitCommand=cmd(zoom,0.6;y,-47.5;x,-146;maxwidth,460);
		};
		LoadFont("Common Normal") .. {
			Text=GAMESTATE:GetPlayerState(PLAYER_2):GetPlayerOptionsString("ModsLevel_Preferred");
			InitCommand=cmd(zoom,0.6;y,-47.5;x,146;maxwidth,460);
		};
		
		LoadFont("Common Normal") .. {
			Text="Rate: "..string.match(string.gsub(GAMESTATE:GetSongOptionsObject("ModsLevel_Song"):MusicRate()+.0001, "(%d....)(.)", "%10"), "(%d..-)0").."x";
			InitCommand=cmd(zoom,0.6;y,-30;x,-146);
		};
		LoadFont("Common Normal") .. {
			Text="Rate: "..string.match(string.gsub(GAMESTATE:GetSongOptionsObject("ModsLevel_Song"):MusicRate()+.0001, "(%d....)(.)", "%10"), "(%d..-)0").."x";
			InitCommand=cmd(zoom,0.6;y,-30;x,146);
		};
	};
};

function ScreenEvalUpdate(self)
	local song = GAMESTATE:GetCurrentSong();

	--cdtitle and banner
	local banner = self:GetChild("Container"):GetChild("Banner");
	local brheight = banner:GetHeight();
	local brwidth = banner:GetWidth();
			
	if song then
		
		songmil = "00"
		
		bpm = string.format("%03.0f",GAMESTATE:GetSongBPS()*60);
		songsec = song:MusicLengthSeconds()%60;
		songmin = math.floor(song:MusicLengthSeconds()/60);
		for c in string.gmatch(songsec,"%d+%p(%d%d)") do
			songmil = c;
		end;
		
		length = string.format("%02d:%02d",  songmin, songsec)..":"..songmil;
		
		title = song:GetDisplayMainTitle();
		if song:HasBanner() then
			banner:visible(true);
			banner:Load(song:GetBannerPath());
		elseif FILEMAN:DoesFileExist(songDir.."banner.png") then
			banner:visible(true);
			banner:Load(songDir.."banner.png");	
		else
			banner:visible(false);
		end;
	end;
		
	self:GetChild("Container"):GetChild("title"):settext(title);
	self:GetChild("Container"):GetChild("BPM"):settext(bpm);
	self:GetChild("Container"):GetChild("length"):settext(length);
			
	if brheight >= 89 and brwidth >= 284 then
		if brheight*(284/89) >= brwidth then
		banner:zoom(88/brheight);
		else
		banner:zoom(284/brwidth);
		end;
	elseif brheight >= 89 then
		banner:zoom(89/brheight);
	elseif brwidth >= 284 then
		banner:zoom(284/brwidth);
	elseif brwidth/3.22 >= brheight then
		banner:zoom(284/brwidth);
	else 
		banner:zoom(89/brheight);
	end;
	
	--nps
	local P1NPS = self:GetChild("Container"):GetChild("P1NPS");
	local P2NPS = self:GetChild("Container"):GetChild("P2NPS");
	
	local function Radar(pn,cat)
		local GetRadar = GAMESTATE:GetCurrentSteps(pn):GetRadarValues(pn);
	    return GetRadar:GetValue(cat);
	end;
	
	if GAMESTATE:IsHumanPlayer(PLAYER_1) then
		local ChartLenghtInSec = song:GetStepsSeconds();
		local P1Taps = Radar(PLAYER_1,'RadarCategory_TapsAndHolds')+Radar(PLAYER_1,'RadarCategory_Jumps')+Radar(PLAYER_1,'RadarCategory_Hands');	
		P1NPS:settext(string.format("%0.0f",P1Taps/ChartLenghtInSec));		
		P2NPS:x(130);
	else
		P2NPS:x(115);
	end;
	
	if GAMESTATE:IsHumanPlayer(PLAYER_2) then
		local ChartLenghtInSec = song:GetStepsSeconds();
		local P2Taps = Radar(PLAYER_2,'RadarCategory_TapsAndHolds')+Radar(PLAYER_2,'RadarCategory_Jumps')+Radar(PLAYER_2,'RadarCategory_Hands');
		P2NPS:settext(string.format("%0.0f",P2Taps/ChartLenghtInSec));
		P1NPS:x(105);
	else
		P1NPS:x(115);
	end;
end;	

return t
