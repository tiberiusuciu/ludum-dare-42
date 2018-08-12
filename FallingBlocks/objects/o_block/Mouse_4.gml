if (o_game.alarm[0] >= 0) {
	return;
}

if (o_game.first_selected_block == noone) {
	o_game.first_selected_block = self;
	is_selected = true;
}
else {
	o_game.second_selected_block = self;
	is_selected = true;
}

audio_sound_pitch(snd_select_block, random_range(.9, 1.1));
audio_play_sound(snd_select_block, 5, false);