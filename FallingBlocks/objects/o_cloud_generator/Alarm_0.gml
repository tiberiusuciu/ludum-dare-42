var cloud = instance_create_layer(x, y + (random_range(0, 24) * 32), "decorations", o_floating_decoration);
if (is_generating_day_clouds) {
	cloud.sprite_index = choose(s_cloud_01, s_cloud_02);
}
else {
	cloud.sprite_index = choose(s_cloud_03, s_cloud_04);
}

cloud.depth = 200;