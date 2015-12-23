VolumeDown(dummyVar="") {
    global
    SoundSet, -%VolumeDownRate%, Master, Volume
	if (SyncWaveVolumeToMasterVolume) {
		SoundGet, MasterVolume, Master, Volume
		SoundSet, MasterVolume, Wave, Volume
	}
    ShowVolume()
}