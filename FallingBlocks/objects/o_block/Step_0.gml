if (o_game.is_game_over) {
	return;
}

vspd += grav; 

//place_meeting(x, y + vspd, o_player)

if (place_meeting(x, y + vspd, o_solid)) {
	while(!place_meeting(x, y + sign(vspd), o_solid)) {
		y += sign(vspd);
	}
	vspd = 0;
	
	if (!has_landed) {
		o_game.doshake = true;
		o_game.alarm[3] = room_speed * .25;
		o_game.shake_amount = 1;
		has_landed = true;
		audio_sound_pitch(snd_block_hits_ground, random_range(.9, 1.1));
		audio_play_sound(snd_block_hits_ground, 5, false);
	}
}

y += vspd;

if (is_selected) {
	if (color == 0) {
		sprite_index = s_blue_block_selected;
	}
	else if (color == 1) {
		sprite_index = s_yellow_block_selected;
	}
	else if (color == 2) {
		sprite_index = s_green_block_selected;
	}
	else if (color == 3) {
		sprite_index = s_red_block_selected;
	}
}
else if (hovering) {
	
	if (color == 0 && !is_selected) {
		sprite_index = s_blue_block_hover;
	}
	else if (color == 1 && !is_selected) {
		sprite_index = s_yellow_block_hover;
	}
	else if (color == 2 && !is_selected) {
		sprite_index = s_green_block_hover;
	}
	else if (color == 3 && !is_selected) {
		sprite_index = s_red_block_hover;
	}
} else {	
	if (color == 0) {
		sprite_index = s_blue_block;
	}
	else if (color == 1) {
		sprite_index = s_yellow_block;
	}
	else if (color == 2) {
		sprite_index = s_green_block;
	}
	else if (color == 3) {
		sprite_index = s_red_block;
	}
}