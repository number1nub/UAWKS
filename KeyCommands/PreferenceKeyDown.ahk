PreferenceKeyDown(normalKey, pref, prefKey) {
	global
	SetKeyDelay, -1
	if (%pref%) {
		Send {Blind}{%prefKey% Down}
	}
	else {
		Send {Blind}{%normalKey% Down}
	}
}