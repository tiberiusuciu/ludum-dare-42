if (o_game.is_game_over) {
	return;
}

randomize()

if (is_active && has_arrow_spawned) {
	if (instance_place(x + (next_row * 32), y, o_block) == noone) {
		var block = instance_create_layer(x + (next_row * 32), y, "Instances", o_block);
		block.color = block_color;
		if (block_color == 0) {
			block.sprite_index = s_blue_block;
			block.value = 10;
		}
		else if (block_color == 1) {
			block.sprite_index = s_yellow_block;
			block.value = 20;
		}
		else if (block_color == 2) {
			block.sprite_index = s_green_block;
			block.value = 30;
		}
		else if (block_color == 3) {
			block.sprite_index = s_red_block;
			block.value = 40;
		}
		has_arrow_spawned = false;
	}
}



next_row = irandom_range(0, 6);
block_color = irandom_range(0, 3);

if (is_active) {
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
}

alarm[0] = room_speed * difficulty;



