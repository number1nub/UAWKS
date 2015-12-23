

Menu, TRAY, Icon, UAWKS.ico
Menu, TRAY, Tip, Unofficial Apple Wireless Keyboard Support
ConfigFilename = UAWKS.ini
SectionName = UAWKS


IniRead, RemapRightCommandToAltGr, %ConfigFilename%, %SectionName%, RemapRightCommandToAltGr, 0
IniRead, RemapCommandToControl, %ConfigFilename%, %SectionName%, RemapCommandToControl, 0
IniRead, RemapCapsLockToControl, %ConfigFilename%, %SectionName%, RemapCapsLockToControl, 0
IniRead, RemapRightOptionToFn, %ConfigFilename%, %SectionName%, RemapRightOptionToFn, 0
IniRead, RemapLeftControlToWindows, %ConfigFilename%, %SectionName%, RemapLeftControlToWindows, 0
;~ IniRead, RemapControlBackquote, %ConfigFilename%, %SectionName%, RemapControlBackquote, 0


IniRead, EjectDelayTime, %ConfigFilename%, %SectionName%, EjectDelayTime, 500

IniRead, VolumeControlsAreDefault, %ConfigFilename%, %SectionName%, VolumeControlsAreDefault, 0
IniRead, MediaControlsAreDefault, %ConfigFilename%, %SectionName%, MediaControlsAreDefault, 0

IniRead, SyncWaveVolumeToMasterVolume, %ConfigFilename%, %SectionName%, SyncWaveVolumeToMasterVolume, 0

IniRead, VolumeChangeRate, %ConfigFilename%, %SectionName%, VolumeChangeRate, 2.0
VolumeDownRate := VolumeChangeRate
VolumeUpRate   := VolumeChangeRate
IniRead, VolumeDownRate, %ConfigFilename%, %SectionName%, VolumeDownRate, %VolumeDownRate% 
IniRead, VolumeUpRate, %ConfigFilename%, %SectionName%, VolumeUpRate, %VolumeUpRate% 

IniRead, OverlayDisplayTime, %ConfigFilename%, %SectionName%, OverlayDisplayTime, 1200
IniRead, OverlayDisplayCentered, %ConfigFilename%, %SectionName%, OverlayDisplayCentered, 1
IniRead, OverlayWidth, %ConfigFilename%, %SectionName%, OverlayWidth, 200
IniRead, OverlayHeight, %ConfigFilename%, %SectionName%, OverlayHeight, 30
IniRead, OverlayTransparency, %ConfigFilename%, %SectionName%, OverlayTransparency, 180

IniRead, ExpertMode, %ConfigFilename%, %SectionName%, ExpertMode, 0
IniRead, ActLikeAMac, %ConfigFilename%, %SectionName%, ActLikeAMac, 1

VolumeColorBg                := "d0f8d0"
VolumeColorBar               := "44ff44"
MutedVolumeColorBg           := "f8d0d0"
MutedVolumeColorBar          := "f03333"

Menu, TRAY, UseErrorLevel, On


ExpertModeMenuText                   := "Enable Expert Mode"
ActLikeAMacMenuText                  := "Use Mac-like Keyboard Shortcuts"

RemapCommandToControlMenuText        := "Use command (apple) keys as control keys"
;~ RemapControlBackquoteMenuText        := "Use control-`` as control-shift-tab"
RemapRightOptionToFnMenuText         := "Use right option key as an extra fn key"
;;                                   ---------------------------------------------
RemapLeftControlToWindowsMenuText    := "Use left control as a Windows key"
RemapCapsLockToControlMenuText       := "Use caps lock as an extra control key"
;;                                   ---------------------------------------------
MediaControlsAreDefaultMenuText      := "Media keys work without holding fn"
VolumeControlsAreDefaultMenuText     := "Volume keys work without holding fn"
SyncWaveVolumeToMasterVolumeMenuText := "Volume changes affect wave device as well"

RemapRightCommandToAltGrMenuText     := "Use right command as AltGr (control+alt)"

Menu, TRAY, NoMainWindow
Menu, TRAY, NoStandard

if (ExpertMode) {
	Menu, TRAY, add, %ExpertModeMenuText%, ExpertModeMenuHandler
	Menu, TRAY, add,,
	Menu, TRAY, add, %RemapCommandToControlMenuText%, RemapCommandToControlMenuHandler
	;~ Menu, TRAY, add, %RemapControlBackquoteMenuText%, RemapControlBackquoteMenuHandler
	Menu, TRAY, add, %RemapRightOptionToFnMenuText%, RemapRightOptionToFnMenuHandler
	Menu, TRAY, add,,
	Menu, TRAY, add, %RemapLeftControlToWindowsMenuText%, RemapLeftControlToWindowsMenuHandler
	Menu, TRAY, add, %RemapCapsLockToControlMenuText%, RemapCapsLockToControlMenuHandler
	Menu, TRAY, add, %RemapRightCommandToAltGrMenuText%, RemapRightCommandToAltGrMenuHandler
	Menu, TRAY, add,,
	Menu, TRAY, add, %MediaControlsAreDefaultMenuText%, MediaControlsAreDefaultMenuHandler
	Menu, TRAY, add, %VolumeControlsAreDefaultMenuText%, VolumeControlsAreDefaultMenuHandler
	Menu, TRAY, add, %SyncWaveVolumeToMasterVolumeMenuText%, SyncWaveVolumeToMasterVolumeMenuHandler
	Menu, TRAY, add,,
	Menu, TRAY, add, Stop UAWKS, MenuQuit
	Menu, TRAY, add, Restart UAWKS, MenuRestart
	Menu, TRAY, Default, Restart UAWKS
} else {
	Menu, TRAY, add, %ExpertModeMenuText%, ExpertModeMenuHandler
	Menu, TRAY, add, %ActLikeAMacMenuText%, ActLikeAMacMenuHandler
	Menu, TRAY, add,,
	Menu, TRAY, add, Stop UAWKS, MenuQuit
	Menu, TRAY, add, Restart UAWKS, MenuRestart
	Menu, TRAY, Default, Restart UAWKS
}

Goto SkipHandlers
MenuQuit:
ExitApp
return
MenuRestart:
Reload
return
ExpertModeMenuHandler:
TogglePreference("ExpertMode")
Reload
return
RemapCommandToControlMenuHandler:
TogglePreference("RemapCommandToControl")
return
RemapCapsLockToControlMenuHandler:
TogglePreference("RemapCapsLockToControl")
return
RemapLeftControlToWindowsMenuHandler:
TogglePreference("RemapLeftControlToWindows")
return
RemapRightOptionToFnMenuHandler:
TogglePreference("RemapRightOptionToFn")
return
RemapControlBackquoteMenuHandler:
TogglePreference("RemapControlBackquote")
return
RemapRightCommandToAltGrMenuHandler:
TogglePreference("RemapRightCommandToAltGr")
return
MediaControlsAreDefaultMenuHandler:
TogglePreference("MediaControlsAreDefault")
return
VolumeControlsAreDefaultMenuHandler:
TogglePreference("VolumeControlsAreDefault")
return
SyncWaveVolumeToMasterVolumeMenuHandler:
TogglePreference("SyncWaveVolumeToMasterVolume")
return
ActLikeAMacMenuHandler:
TogglePreference("ActLikeAMac")
return


SkipHandlers:

DetectHiddenWindows, On
SetCapsLockState, Off

InitPreference("ExpertMode")
InitPreference("ActLikeAMac")

InitPreference("RemapCommandToControl")
InitPreference("RemapLeftControlToWindows")
InitPreference("RemapRightOptionToFn")
InitPreference("RemapCapsLockToControl")
InitPreference("RemapRightCommandToAltGr")
;~ InitPreference("RemapControlBackquote")
InitPreference("MediaControlsAreDefault")
InitPreference("VolumeControlsAreDefault")
InitPreference("SyncWaveVolumeToMasterVolume")

if (!ExpertMode) {
	SetCapsLockState, Off
	RemapCapsLockToControl   := 0
	MediaControlsAreDefault  := 0
	VolumeControlsAreDefault := 0
	RemapRightOptionToFn     := 0
	RemapRightCommandToAltGr := 0
}

