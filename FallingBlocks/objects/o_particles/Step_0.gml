if (use_grav) {
	vspd += grav;

	//place_meeting(x, y + vspd, o_player)

	if (place_meeting(x, y + vspd, o_solid)) {
		while(!place_meeting(x, y + sign(vspd), o_solid)) {
			y += sign(vspd);
		}
		vspd = 0;
	}

	y += vspd;
}