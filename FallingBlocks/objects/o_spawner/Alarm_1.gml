if (o_game.is_game_over) {
	return;
}

if (difficulty <= .8) {
	prev_difficulty = difficulty;
	difficulty = max(.4, difficulty - .05);
}
else {
	prev_difficulty = difficulty;
	difficulty = max(.8, difficulty - .2);
}

o_game.increasing_difficulty = true;

alarm[1] = room_speed * 10;