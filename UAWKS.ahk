#NoEnv
#KeyHistory 0
#SingleInstance, Force
SetWorkingDir %A_ScriptDir%
SendMode, Input

global fnPressed, ejKeyPressed


#Include %A_ScriptDir%
#Include AWK Library.ahk
#Include FnMapper.ahk
#Include InitPreference.ahk
#Include Media Keys.ahk
#Include Navigation Keys.ahk
#Include SetPreference.ahk
#Include System Keys.ahk
#Include TogglePreference.ahk
#Include User Keys.ahk
#Include User Preferences.ahk

#Include KeyCommands\FnKey.ahk
#Include KeyCommands\FnKeyCall.ahk
#Include KeyCommands\PreferenceKeyDown.ahk
#Include KeyCommands\PreferenceKeyUp.ahk
#Include KeyCommands\PreferenceKeyFnDown.ahk
#Include KeyCommands\PreferenceKeyFnUp.ahk

#Include Media\ActiveWindowIsAMediaPlayer.ahk
#Include Media\MediaCommandPrev.ahk
#Include Media\MediaCommandPlay.ahk
#Include Media\MediaCommandNext.ahk
#Include Media\ShowVolume.ahk
#Include Media\VolumeMute.ahk
#Include Media\VolumeDown.ahk
#Include Media\VolumeUp.ahk
#Include Media\VolumeSet.ahk