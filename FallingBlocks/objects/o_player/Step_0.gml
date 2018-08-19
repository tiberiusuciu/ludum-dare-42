var right = keyboard_check(ord("D")) || keyboard_check(vk_right);
var left = keyboard_check(ord("A")) || keyboard_check(vk_left);
var jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);

if (jump && place_meeting(x, y + 1, o_solid) && has_double_jumped == false) {
	vspd = jumpspd;
	audio_play_sound(snd_jumping, 5, false);
	has_landed = false;
}
else if (jump && has_double_jumped == false) {
	has_double_jumped = true;
	vspd = jumpspd;
	audio_play_sound(snd_jumping, 5, false);
	has_landed = false;
}

hspd = (right - left) * movespd;
vspd += grav;

if (!remove_collisions) {
	if (place_meeting(x + hspd, y, o_solid)) {
		while (!place_meeting(x + sign(hspd), y, o_solid)) {
			x += sign(hspd);
		}
		hspd = 0;
	}

	if (place_meeting(x, y + vspd, o_solid)) {
		while(!place_meeting(x, y + sign(vspd), o_solid)) {
			y += sign(vspd);
		}
		vspd = 0;
		
		if (!has_landed) {
			has_landed = true;
			has_double_jumped = false;
			audio_sound_pitch(snd_landing, random_range(.9, 1.1));
			audio_play_sound(snd_landing, 5, false);
		}
	}
}

if (hspd != 0) {
	image_speed = 1;
	if (sign(hspd) == -1) {
		image_xscale = -1;
	}
	
	if (sign(hspd) == 1) {
		image_xscale = 1;
	}
}
else {
	image_speed = 0;
	image_index = 0;
}


if (vspd < 0) {
	sprite_index = s_player_jump;
	image_index = 0;
	image_speed = 0;
}
else if (vspd > 0) {
	sprite_index = s_player_jump;
	image_index = 1;
	image_speed = 0;
}
else if (vspd == 0) {
	sprite_index = s_player;
}


if (has_picked_up_powerup) {
	sprite_index = s_player_powerup;
}

if (is_hurting) {
	sprite_index = s_player_hurt;
}

if (o_game.is_game_over) {
	image_xscale = clamp(image_xscale + sign(image_xscale) * .1, -2, 2);
	image_yscale = min(2, image_yscale + .1);
	sprite_index = s_player_dead;
}

x += hspd;
y += vspd;

