PreferenceKeyFnUp(normalKey, pref) {
	global
	SetKeyDelay, -1
	if (%pref%) {
		fnPressed := false
	}
	else {
		Send {Blind}%normalKey%
	}
}