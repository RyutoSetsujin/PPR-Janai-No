local t = Def.ActorFrame{};

local BG = "";

if ThemePrefs.Get("DisplayPreference") == "Faithful" then
  BG = "classic"
elseif ThemePrefs.Get("DisplayPreference") == "Modern" then
  BG = "modern"
elseif ThemePrefs.Get("DisplayPreference") == "Graphic Missing" then
  BG = "missing"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(BG);
};

return t
