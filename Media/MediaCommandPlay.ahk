MediaCommandPlay(dummyVar="") {
    if (ActiveWindowIsAMediaPlayer())
		GoTo SendMediaCommandPlay
	if (WinExist("ahk_class iTunes")) {
		ControlSend, ahk_parent, ^{Space}
		return
	}
	SendMediaCommandPlay:
	Send, {Media_Play_Pause}
}