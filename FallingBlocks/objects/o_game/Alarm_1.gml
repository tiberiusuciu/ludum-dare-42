var pos = irandom_range(0, 6) * 32;


var player = instance_create_layer(o_spawner.x + pos + 16, o_spawner.y + 32, "Instances", o_player);


o_spawner.prev_difficulty = o_spawner.difficulty;
o_spawner.difficulty += .1;
increasing_difficulty = true;

player.is_hurting = true;
player.alarm[0] = room_speed * 5;