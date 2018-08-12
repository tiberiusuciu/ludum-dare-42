if (has_powerup) {
	
	if (instance_exists(o_player)) {
		o_player.has_picked_up_powerup = true;
		o_player.alarm[1] = room_speed * 2;
	}
	if (powerup == 0) {
		with (o_block) {
			if (x == other.x) {
				instance_destroy();
			}
		}
		
		audio_sound_pitch(snd_powerups, random_range(.9, 1.1));
		audio_play_sound(snd_powerups, 5, false);
	}
	else if (powerup == 1) {
		with (o_block) {
			if (y == other.y) {
				instance_destroy();
			}
		}
		
		audio_sound_pitch(snd_powerups, random_range(.9, 1.1));
		audio_play_sound(snd_powerups, 5, false);
	}
	else if (powerup == 2) {
		with (o_block) {
			if ((x == other.x - 32 || x == other.x + 32 || x == other.x)
			&& (y == other.y - 32 || y == other.y + 32 || y == other.y)) {
				instance_destroy();
			}
		}
		
		audio_sound_pitch(snd_powerups, random_range(.9, 1.1));
		audio_play_sound(snd_powerups, 5, false);
	}
	else if (powerup == 3) {
		o_game.player_health++;
		
		audio_sound_pitch(snd_getting_health, random_range(.9, 1.1));
		audio_play_sound(snd_getting_health, 5, false);
	}
	if (!o_game.doshake) {
		o_game.doshake = true;
		o_game.alarm[3] = room_speed * .25;
	}
}

var animation = instance_create_layer(x, y, "Instances", o_particles);
animation.is_text = true;
animation.text = value;
animation.alarm[1] = room_speed * 1.5;

o_game.game_score += value;

audio_sound_pitch(snd_block_destroyed, random_range(.9, 1.1));
audio_play_sound(snd_block_destroyed, 2, false);