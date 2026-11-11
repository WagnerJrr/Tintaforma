desenha_efeito_mola();

//draw_sprite_ext(sprite_index, image_index,x, y, xscale * dir, yscale, image_angle, image_blend, image_alpha);

//desnhando brilho
shader_set(sh_brilho);
draw_sprite_ext(sprite_index, image_index,x, y, xscale * dir, yscale, image_angle, cor_brilho, alfa_brilho);
shader_reset()

draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);

draw_text(x, y, global.contador_chave)