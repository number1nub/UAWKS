FnKey(NormalAction, FnAction, FnActionIsDefault:="") {
	global fnPressed
    SetKeyDelay, -1
    if (fnPressed = FnActionIsDefault) {
		Send {Blind}%NormalAction%
	}
	else {
		Send {Blind}%FnAction%
	}
}