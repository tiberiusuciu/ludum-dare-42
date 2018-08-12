draw_set_font(fnt_proggy);

if (room == room0) {
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	
	draw_set_color(make_color_rgb(227, 94, 51));
	draw_text(room_width/2 - 70, 50, "Ludum");
	draw_set_color(make_color_rgb(227, 139, 48));
	draw_text(room_width/2 + 5, 50, "Dare");
	draw_set_color(make_color_rgb(250, 222, 55));
	draw_text(room_width/2 + 75, 50, "42");


	draw_set_color(c_white);
	
	draw_text(room_width/2, 100, "Tiberiusuciu Presents:");

	
	draw_set_color(make_color_rgb(0, 255, 255));
	draw_text(room_width/2, 150, "Match In A Bottle");
	draw_set_color(c_white);
	
	
	draw_set_valign(fa_center);
	draw_set_halign(fa_left);
	var text = "Welcome to my Ludum Dare 42 entry!\n\nThe theme is 'Running out of space' so I present you my game!\n\nYou are trapped in a bottle, you must avoid the falling cubes from the top of the bottle.\n\nUse the arrow keys or WASD to navigate. You can use 'up_arrow', 'W' or 'space' for jumping!\n\nIn order to survive, you must get rid of the blocks in the bottle or you will suffocate otherwise!\n\nBy selecting full lines of the same color blocks, you can free-up some space and earn some points!\n\nIn order to select lines, left click using your mouse from each end of a line. Please note that each box of the line must have the same color!\n\nThere are also powerups in some of the cubes!\n\nBreak the cubes in order to activate their special abilities!\n\nP.S. Bring a friend along, it get's more fun if you split the work load, one takes care of moving, the other takes care of matching lines!\n\nPress 'M' to mute music\n\n<PRESS ENTER TO BEGIN>";

	draw_text_ext_transformed(room_width/20, 450, text, 30, 1080, .6, .6, 0);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	draw_text(room_width - 180, 10, "Move:");
	
	draw_sprite(s_wasd, 0, room_width - 250, 50);
	draw_sprite(s_arrows, 0, room_width - 150, 50);
	
	draw_text(room_width - 180, 160, "Jump:");
	draw_sprite(s_w, 0, room_width - 250, 200);
	draw_sprite(s_up, 0, room_width - 200, 200);
	draw_sprite(s_space, 0, room_width - 150, 200);
	
	draw_sprite(s_right, 0, room_width - 230, 300);
	draw_sprite(s_blue_block, 0, room_width - 270, 350);
	draw_sprite(s_blue_block, 0, room_width - 238, 350);
	
	draw_text_ext_transformed(room_width - 130, 290, "<- Click here", 30, 600, .6, .6, 0);
	draw_text_ext_transformed(room_width - 130, 360, "<- And here", 30, 600, .6, .6, 0);	
	
	draw_sprite(s_blue_block, 0, room_width - 170, 286);
	draw_sprite(s_blue_block, 0, room_width - 170, 318);
	draw_sprite(s_blue_block, 0, room_width - 170, 350);
	
	draw_sprite(s_wrong, 0, room_width - 230, 450);
	draw_sprite(s_blue_block, 0, room_width - 270, 500);
	draw_sprite(s_green_block, 0, room_width - 238, 500);
	
	draw_text_ext_transformed(room_width - 320, 550, "Must be same color!", 30, 600, .6, .6, 0);
	
	draw_sprite(s_blue_block, 0, room_width - 170, 436);
	//draw_sprite(s_blue_block, 0, room_width - 150, 468);
	draw_text_ext_transformed(room_width - 130, 480, "<- No Gap", 30, 600, .6, .6, 0);
	draw_sprite(s_blue_block, 0, room_width - 170, 500);
	
	
	
	draw_sprite_ext(s_heal_powerup, 0, room_width - 300, 570, 2, 2, 0, c_white, 1);
	draw_text_ext_transformed(room_width - 230, 595, "Heal powerup", 30, 600, .6, .6, 0);
	draw_sprite_ext(s_vertical_powerup, 0, room_width - 300, 620, 2, 2, 0, c_white, 1);
	draw_text_ext_transformed(room_width - 230, 645, "Vertical Bomb", 30, 600, .6, .6, 0);
	draw_sprite_ext(s_horizontal_powerup, 0, room_width - 300, 670, 2, 2, 0, c_white, 1);
	draw_text_ext_transformed(room_width - 230, 695, "Horizontal Bomb", 30, 600, .6, .6, 0);
	draw_sprite_ext(s_bomb_powerup, 0, room_width - 300, 720, 2, 2, 0, c_white, 1);
	draw_text_ext_transformed(room_width - 230, 745, "Small Bomb", 30, 600, .6, .6, 0);

}
else {
	if (!show_credits) {
		draw_sprite(s_health, 0, 10, 10);
		draw_text(40, 15, " X " + string(player_health));

		draw_set_halign(fa_right);
		draw_text(room_width - 60, 15, "SCORE: " + string(game_score));
		draw_set_halign(fa_left);

		if (increasing_difficulty && o_spawner.prev_difficulty != o_spawner.difficulty) {
	
			if (!alarm[2] > 0) {
				alarm[2] = room_speed * 3;
			}
			
			draw_set_halign(fa_center);
			draw_text(room_width/2, room_height - 50, "Changing frequency to 1 block every " + string(o_spawner.difficulty) + " seconds!");
			draw_set_halign(fa_left);
						
		}
	}

	if (show_credits) {
		draw_set_valign(fa_center);
		draw_set_halign(fa_center);
	
		draw_text(room_width/2, room_height/10, "You scored: " + string(game_score));
	
		var text03 = "I hope you enjoyed my game!\nSpecial thanks goes to my parents and my supportive girlfriend for encouraging me to participate into this event.\n\nMake sure to write to me on my Ludum Dare post, I would like to hear your opinion!\nAlso, here are my social media usernames:\n\nTwitter: @SuciuTiberius \nTwitch: @Tiberiusuciu\n\nThank you and I'm looking forward to LD43!\n\n\nPress 'R' to Restart or 'ESC' to Quit";

		draw_text_ext(room_width/2, room_height/2, text03, 30, 700);
	}
}