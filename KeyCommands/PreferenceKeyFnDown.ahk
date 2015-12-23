PreferenceKeyFnDown(normalKey, pref) {
	global
	SetKeyDelay, -1
	if (%pref%) {
		fnPressed := true
	}
	else {
		Send {Blind}%normalKey%
	}
}