next_row = irandom_range(0, 6);
is_active = true;

difficulty = 2;
prev_difficulty = difficulty;

alarm[0] = room_speed * difficulty;
alarm[1] = room_speed * 10;

randomize();