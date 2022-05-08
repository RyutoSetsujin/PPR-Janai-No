local t = Def.ActorFrame{
    LoadActor("bg")..{
        InitCommand=cmd(FullScreen);
    };
};
return t;