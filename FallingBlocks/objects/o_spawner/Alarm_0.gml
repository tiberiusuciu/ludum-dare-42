if (o_game.is_game_over) {
	return;
}

randomize()

if (is_active) {
	if (instance_place(x + (next_row * 32), y, o_block) == noone) {
		instance_create_layer(x + (next_row * 32), y, "Instances", o_block);
	}
}



next_row = irandom_range(0, 6);

alarm[0] = room_speed * difficulty;

