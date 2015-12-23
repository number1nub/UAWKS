ActiveWindowIsAMediaPlayer() {
	SetTitleMatchMode RegEx
	IfWinActive, ^Windows Media Player$
		Return true
	IfWinActive, ahk_class iTunes
		Return true
	IfWinActive, ahk_class MediaPlayerClassicW
		Return true
	Return false
}