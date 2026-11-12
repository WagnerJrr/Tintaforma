function inicia_brilho()
{
    //variaveis do brilho
    cor_brilho =    c_white
    alfa_brilho =   0
    
    xscale =        1
    yscale =        1
    dir =           0
}

function muda_brilho(_cor = c_white, _valor = 1)
{
    cor_brilho = _cor
    alfa_brilho = _valor
}

function volta_brilho(_valor = .1)
{
    alfa_brilho = lerp(alfa_brilho, 0, _valor)
}

function desenha_brilho()
{
    //desnhando brilho 
    shader_set(sh_brilho); 
    draw_sprite_ext(sprite_index, image_index,x, y, xscale * dir, yscale, image_angle, cor_brilho, alfa_brilho); 
    shader_reset()
}