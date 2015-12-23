MediaCommandNext(dummyVar="") {
    if (ActiveWindowIsAMediaPlayer())
		GoTo SendMediaCommandNext
	if (WinExist("ahk_class iTunes")) {
		ControlSend, ahk_parent, ^{Right}
		return
	}	
	SendMediaCommandNext:
	Send, {Media_Next}
}