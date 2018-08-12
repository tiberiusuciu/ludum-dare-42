morning = make_color_rgb(250, 190, 1);
day = make_color_rgb(135, 206, 250);
dusk = make_color_rgb(253, 94, 83);
night = make_color_rgb(19,24,98);

currentDuration = 0;
currentColor = morning;
nextColor = day;
morningMaxDuration = room_speed * 10;
dayMaxDuration = room_speed * 35;
duskMaxDuration = room_speed * 10;
nightMaxDuration = room_speed * 35;

//depth = 400;