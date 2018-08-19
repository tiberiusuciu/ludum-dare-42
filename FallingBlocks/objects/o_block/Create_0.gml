vspd = 0;
grav = .5;
is_selected = false;
hovering = false;

has_powerup = irandom_range(0, 100) <= 15;
powerup = noone;
powerup_sprite = noone;
has_landed = false;

if (has_powerup) {
	powerup = choose(0, 1, 2, 3);
	if (powerup == 0) {
		powerup_sprite = s_vertical_powerup;
	}
	else if (powerup == 1) {
		powerup_sprite = s_horizontal_powerup;
	}
	else if (powerup == 2) {
		powerup_sprite = s_bomb_powerup;
	}
	else if (powerup == 3) {
		powerup_sprite = s_heal_powerup;
	}
}

value = 0;
/* color = irandom_range(0, 3);

if (color == 0) {
	sprite_index = s_blue_block;
	value = 10;
}
else if (color == 1) {
	sprite_index = s_yellow_block;
	value = 20;
}
else if (color == 2) {
	sprite_index = s_green_block;
	value = 30;
}
else if (color == 3) {
	sprite_index = s_red_block;
	value = 40;
}
*/