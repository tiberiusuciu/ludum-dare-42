if (vspd != 0 && other.y - 32 > y) {	
	o_game.player_hurt = true;
	o_spawner.is_active = false;
	o_spawner.has_arrow_spawned = false;
	o_spawner.alarm[2] = room_speed * 3;
	instance_destroy();                  
}
	