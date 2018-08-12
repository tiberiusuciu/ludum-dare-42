if (room == room0) {
	if (keyboard_check(vk_enter)) {
		room_goto_next();
	}
}

if (is_game_over) {
	if (!alarm[4] > 0) {
		instance_deactivate_object(o_block);
		alarm[4] = room_speed * 5;
	}
	
	fadein = min(fadein+.0039, 1);
	
	if (keyboard_check(ord("R"))) {
		game_restart();
	}
	
	if (keyboard_check(vk_escape)) {
		game_end();
	}

	return;
}

if (first_selected_block != noone && second_selected_block != noone) {
	var x1 = first_selected_block.x;
	var x2 = second_selected_block.x;
	var y1 = first_selected_block.y;
	var y2 = second_selected_block.y;
	var color = first_selected_block.color;
	
	var is_valid = true;
	blocks_to_destroy[0] = first_selected_block;
	
	if (first_selected_block.color == second_selected_block.color) {
		if (x1 == x2 && y1 != y2) {
			if (y1 < y2) { // top to bottom
				var multiplier = 1;
				while (y1 + 32 * multiplier <= y2) {
					var block = instance_nearest(x1, y1 + 32 * multiplier, o_block);
				
				
					if (block.color != first_selected_block.color) {
						is_valid = false;
					}
					else {
						blocks_to_destroy[multiplier] = block;
					}
				
				
					multiplier++;
				}
			}
			else { // bottom to top
				var multiplier = 1;
				while (y1 - 32 * multiplier >= y2) {
					var block = instance_nearest(x1, y1 - 32 * multiplier, o_block);
				
					if (block.color != first_selected_block.color) {
						is_valid = false;
					}
					else {
						blocks_to_destroy[multiplier] = block;
					}
				
					multiplier++;
				}
			}
		}
		else if (y1 == y2 && x1 != x2) {
			if (x1 < x2) { // Left to Right
				var multiplier = 1;
				while (x1 + 32 * multiplier <= x2) {
					var block = instance_position(x1 + 32 * multiplier, y1, o_block);
					
					if (block != noone) {
						if (block.color != first_selected_block.color) {
							is_valid = false;
						}
						else {
							blocks_to_destroy[multiplier] = block;
						}
					}
					else {
						is_valid = false;
						break;
					}
				
				
					multiplier++;
				}
			}
			else { // Right to Left
				var multiplier = 1;
				while (x1 - 32 * multiplier >= x2) {
					var block = instance_position(x1 - 32 * multiplier, y1, o_block);
				
					if (block != noone) {
						if (block.color != first_selected_block.color) {
							is_valid = false;
						}
						else {
							blocks_to_destroy[multiplier] = block;
						}
					}
					else {
						is_valid = false;
						break;
					}
				
				
					multiplier++;
				}
			}
		}
		else {
			is_valid = false;
		}
	}
	else {
		is_valid = false;
	}
	
	if (is_valid) {
		
		for (var i = 0; i < array_length_1d(blocks_to_destroy); i++) {
			blocks_to_destroy[i].is_selected = true;
		}
		
		audio_sound_pitch(snd_match_success, random_range(.9, 1.1));
		audio_play_sound(snd_match_success, 5, false);
		
		alarm[0] = room_speed / 8;
	}
	else {
		audio_sound_pitch(snd_match_fail, random_range(.9, 1.1));
		audio_play_sound(snd_match_fail, 5, false);
		blocks_to_destroy = 0;
		first_selected_block.is_selected = false;
		second_selected_block.is_selected = false;
	}
	
	first_selected_block = noone;
	second_selected_block = noone;
}

if (player_hurt) {
	player_health--;
	
	if (player_health <= 0) {
		player_health = 0;
		is_game_over = true;
		with (o_player) {
			remove_collisions = true;
			depth = -1000;
			vspd = -3;
			grav = .1;
			audio_sound_pitch(snd_death, random_range(.9, 1.1));
			audio_play_sound(snd_death, 7, false);
		}
		o_spawner.is_active = false;
		
		
	}
	else {
		with (o_player) {
			var animation = instance_create_layer(x, y, "Instances", o_particles);
			animation.sprite_index = s_death_animation;
			animation.image_speed = 1;
			animation.use_grav = true;
			animation.alarm[0] = room_speed * 3;
			
			var animation2 = instance_create_layer(x, y, "Instances", o_particles);
			animation2.is_text = true;
			animation2.text = "-100";
			animation2.alarm[1] = room_speed * 1.5;
			
			audio_sound_pitch(snd_getting_hurt, random_range(.9, 1.1));
			audio_play_sound(snd_getting_hurt, 7, false);
			
			instance_destroy();
		}
		alarm[1] = room_speed * 2;
		doshake = true;
		alarm[3] = room_speed * .25;
	}
	
	game_score = max(0, game_score - 100);
	
	
	player_hurt = false;
}

if (doshake) {
	var range = random_range(-shake_amount, shake_amount);
	camera_set_view_pos(view_camera[0], x + range, y);
}