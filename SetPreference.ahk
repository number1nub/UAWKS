SetPreference(name, newValue) {
	global
	SetEnv, %name%, %newValue%
	MenuText := %name%MenuText
	
	menu, TRAY, % newValue ? "Check":"Uncheck", %MenuText%
	
	if (name = "RemapCapsLockToControl")
		SetCapsLockState, % newValue ? "AlwaysOff":"Off"
	
	if (!ExpertMode && name = "ActLikeAMac") {
		if (newValue) {
			SetPreference("RemapCommandToControl", 1)
			SetPreference("RemapLeftControlToWindows", 1)
			;~ SetPreference("RemapControlBackquote", 1)
		} else {
			SetPreference("RemapCommandToControl", 0)
			SetPreference("RemapLeftControlToWindows", 0)
			;~ SetPreference("RemapControlBackquote", 0)
		}
	}
	
	IniWrite, %newValue%, %ConfigFilename%, %SectionName%, %name%
}