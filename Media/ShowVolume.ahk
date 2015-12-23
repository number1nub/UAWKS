ShowVolume() {
    global
    SoundGet, MasterVolume, Master, Volume
    SoundGet, WaveVolume, Wave, Volume
    
    IfWinNotExist, Master Volume
    {
        SoundGet, MasterMute, Master, Mute
        if (MasterMute = "on")
            bgColor:=MutedVolumeColorBg, barColor:=utedVolumeColorBar
        else
            bgColor:=VolumeColorBg, barColor:=VolumeColorBar
        SetWinDelay, -1
		ColorStr = cw%bgColor% ct0000CC cb%barColor%
		SizeStr  =  h%OverlayHeight% w%OverlayWidth% zh%OverlayHeight% zx0 zy0
        Progress, 1: p%MasterVolume% b %SizeStr% %ColorStr%, , , Master Volume, Arial
		WinSet, Transparent, %OverlayTransparency%, Master Volume
        ;WinGetPos, X1, Y1, Width1, Height1, Master Volume
		if not OverlayDisplayCentered {
			WinMove, Master Volume, , 0, 0
		}
    }
    else
        Progress, 1: %MasterVolume%	
    SetTimer ProgressOff, %OverlayDisplayTime%
}