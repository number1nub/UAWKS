FnKeyCall(NormalAction, FnActionCall, FnArgs = "", FnActionIsDefault:="") {
	global fnPressed
    SetKeyDelay, -1
    if (fnPressed = FnActionIsDefault) {
		Send {Blind}%NormalAction%
	}
	else {
        %FnActionCall%(FnArgs)
	}
}