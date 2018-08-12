if (keyboard_check_pressed(ord("M"))) {
	
	if (muteMusic) {
		audio_stop_sound(snd_bg_music);
	}
	else {
		audio_play_sound(snd_bg_music, 7, true);
	}
	
	muteMusic = !muteMusic;
}