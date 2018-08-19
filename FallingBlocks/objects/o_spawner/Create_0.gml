next_row = irandom_range(0, 6);
block_color = irandom_range(0, 3);
is_active = true;
has_arrow_spawned = false;

difficulty = 2;
prev_difficulty = difficulty;

var arrow = instance_create_layer(x + (32 * next_row), y, "Instances", o_particles);
arrow.image_speed = .25;

if (block_color == 0) {
	arrow.sprite_index = s_bluearrow;
}
else if (block_color == 1) {
	arrow.sprite_index = s_yellowarrow;
}
else if (block_color == 2) {
	arrow.sprite_index = s_greenarrow;
}
else if (block_color == 3) {
	arrow.sprite_index = s_redarrow;
}

arrow.alarm[0] = room_speed * difficulty;
has_arrow_spawned = true;

alarm[0] = room_speed * difficulty;
alarm[1] = room_speed * 10;

randomize();