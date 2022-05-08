do
	--if there isn't music for a specific screen it falls back to common
	local music = {
		common = {
			["Faithful"] = "_classic (loop).mp3";
			["Modern"] = "_new (loop).wav";
		};
	}
	--thanks to this code
	for name,child in pairs(music) do
		if name ~= "common" then
			setmetatable(child, {__index=music.common})
		end
	end
	function GetMenuMusicPath(type, relative)
		local possibles = music[type] 
			or error("GetMenuMusicPath: unknown menu music type "..type, 2)
		local selection = ThemePrefs.Get("DisplayPreference")
		local file = possibles[selection]
			or error("GetMenuMusicPath: no menu music defined for selection"..selection, 2)
		return relative and file or THEME:GetPathS("", file)
	end
end