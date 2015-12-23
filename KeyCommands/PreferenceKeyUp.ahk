PreferenceKeyUp(normalKey, pref, prefKey) {
	global
	SetKeyDelay, -1
	if (%pref%) {
		Send {Blind}{%prefKey% Up}
	}
	else {
		Send {Blind}{%normalKey% Up}
	}
}