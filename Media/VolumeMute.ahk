VolumeMute(dummyVar="") {
    Send {Volume_Mute}
    GoSub, ProgressOff
    ShowVolume()
}