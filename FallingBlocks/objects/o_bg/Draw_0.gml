
var maxDuration;

if (currentColor == morning) {
	maxDuration = morningMaxDuration;
}
else if (currentColor == day) {
	maxDuration = dayMaxDuration;
}
else if (currentColor == dusk) {
	maxDuration = duskMaxDuration;
}
else if (currentColor == night) {
	maxDuration = nightMaxDuration;
}

var ratio = clamp((currentDuration/maxDuration), 0, 1);
var color = merge_color(currentColor, nextColor, ratio);

//draw_set_alpha(.5);
draw_rectangle_color(0, 0, room_width, room_height, color, color, color, color, false);
//draw_set_alpha(1);

currentDuration++;

if (currentDuration >= maxDuration) {
	if (currentColor == morning) {
		currentColor = nextColor;
		nextColor = dusk;
	}
	else if (currentColor == day) {
		currentColor = nextColor;
		nextColor = night;
	}
	else if (currentColor == dusk) {
		currentColor = nextColor;
		nextColor = morning;
	}
	else if (currentColor == night) {
		currentColor = nextColor;
		nextColor = day;
	}
	currentDuration = 0;
}