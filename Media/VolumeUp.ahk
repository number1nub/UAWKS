VolumeUp(dummyVar="") {
    global
    SoundSet, +%VolumeUpRate%, Master, Volume
	if (SyncWaveVolumeToMasterVolume) {
		SoundGet, MasterVolume, Master, Volume
		SoundSet, MasterVolume, Wave, Volume
	}
    ShowVolume()
}