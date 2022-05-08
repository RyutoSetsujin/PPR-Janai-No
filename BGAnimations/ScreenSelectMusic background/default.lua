local t = Def.ActorFrame{};

local BG = "";

if ThemePrefs.Get("BGStyle") == "Classic" then
  BG = "classic"
elseif ThemePrefs.Get("BGStyle") == "Popira" then
  BG = "popira1"
elseif ThemePrefs.Get("BGStyle") == "Popira2" then
  BG = "popira2"
elseif ThemePrefs.Get("BGStyle") == "Taiko de Popira" then
  BG = "taikode"
elseif ThemePrefs.Get("BGStyle") == "Jumpin' Popira" then
  BG = "jumpin"
elseif ThemePrefs.Get("BGStyle") == "Modern" then
  BG = "modern"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(BG);
};

return t
