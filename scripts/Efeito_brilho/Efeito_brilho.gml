inicia_brilho = function ()
{
    //variaveis do brilho
    cor_brilho = noone
    alfa_brilho = 0
}

muda_brilho = function ()
{
    if(keyboard_check(ord("B")))
    {
        cor_brilho = c_white
    }
    else if(keyboard_check(ord("C")))
    {
        cor_brilho = c_grey
    }
    else if(keyboard_check(ord("Y")))
    {
        cor_brilho = c_yellow
    }
    else if(keyboard_check(ord("K")))
    {
        alfa_brilho = 1
    }
}

volta_brilho = function ()
{
    alfa_brilho = lerp(alfa_brilho, 0, .1)
}

desenha_brilho = function ()
{
    //desnhando brilho 
    shader_set(sh_brilho); 
    draw_sprite_ext(sprite_index, image_index,x, y, xscale * dir, yscale, image_angle, cor_brilho, alfa_brilho); 
    shader_reset()
}