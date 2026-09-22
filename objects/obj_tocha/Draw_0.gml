//variando a escala da tocha
var _tocha = random_range(0, 0.02)

//desenhando brilho
gpu_set_blendmode(bm_add);
draw_sprite_ext(spr_brilho_tocha, 0, x, y, 0.4 + _tocha, 0.4 + _tocha, 0, c_yellow, 0.2);
gpu_set_blendmode(bm_normal);