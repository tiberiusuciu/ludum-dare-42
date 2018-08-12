///@desc Blocks destruction
for (var i = 0; i < array_length_1d(blocks_to_destroy); i++) {
	if (instance_exists(blocks_to_destroy[i])) {
		instance_destroy(blocks_to_destroy[i].id);
	}
}

blocks_to_destroy = 0;