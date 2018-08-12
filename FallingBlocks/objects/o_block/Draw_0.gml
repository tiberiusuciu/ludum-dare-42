draw_self();

if (has_powerup) {
	if (powerup == 0) {
		draw_sprite(s_vertical_powerup, 0, x, y);	
	}
	else if (powerup == 1) {
		draw_sprite(s_horizontal_powerup, 0, x, y);
	}
	else if (powerup == 2) {
		draw_sprite(s_bomb_powerup, 0, x, y);
	}
	else if (powerup == 3) {
		draw_sprite(s_heal_powerup, 0, x, y);
	}
}