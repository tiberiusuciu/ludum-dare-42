if (sprite_index) {
	draw_self();
}

if (is_text) {
	draw_set_color(c_fuchsia);
	draw_text(x, y, text);
	draw_set_color(c_white);
}