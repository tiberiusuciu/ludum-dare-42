if (alarm[0] < 0) {
	alarm[0] = room_speed * random(.5);
}

if (o_bg.currentColor == o_bg.dusk || o_bg.currentColor == o_bg.night) {
	is_generating_day_clouds = false;
}
else {
	is_generating_day_clouds = true;
}