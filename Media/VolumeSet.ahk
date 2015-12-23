VolumeSet(NewVolume, UnMute = false) {
	global
    SoundSet, %NewVolume%, Master, Volume
	if (SyncWaveVolumeToMasterVolume)
		SoundSet, %NewVolume%, Wave, Volume
    if (UnMute) {
        ; Avoid flicker if already unmuted
        SoundGet, IsMuted, Master, Mute
        if (IsMuted = "On") {
            SoundSet, Off, Master, Mute
            GoSub, ProgressOff
        }
    }
    ShowVolume()
}