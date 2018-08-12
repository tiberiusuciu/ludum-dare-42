if ((o_bg.currentColor == o_bg.dusk)
&& !is_moon_spawned) {
	var celestial = instance_create_layer(x, y + (random_range(0, 2) * 32), "decorations", o_floating_decoration);
	celestial.sprite_index = s_moon;
	celestial.depth = 250;
	celestial.hspd = 1;
	is_moon_spawned = true;
}
else if ((o_bg.currentColor == o_bg.morning)
&& !is_sun_spawned) {
	var celestial = instance_create_layer(x, y + (random_range(0, 2) * 32), "decorations", o_floating_decoration);
	celestial.sprite_index = s_sun;
	celestial.depth = 250;
	celestial.hspd = 1;
	is_sun_spawned = true;
}