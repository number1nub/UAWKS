MediaCommandPrev(dummyVar="") {
    if (ActiveWindowIsAMediaPlayer())
		GoTo SendMediaCommandPrev	
	if (WinExist("ahk_class iTunes")) {
		ControlSend, ahk_parent, ^{Left}^{Left}
		return
	}	
	SendMediaCommandPrev:
	Send, {Media_Prev}
}