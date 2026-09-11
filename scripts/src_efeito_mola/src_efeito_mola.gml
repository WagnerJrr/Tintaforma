function inicia_efeito_mola()
{
    //iniciando as variaveis que irei usar
    xscale = 1;
    yscale = 1;
}

//defininfo valor do amassar
function efeito_mola(_xscale = 1, _yscale = 1)
{
    xscale = _xscale;
    yscale = _yscale;
}

function retorna_mola(_qtd = .1)
{
    xscale = lerp(xscale, 1, _qtd);
    yscale = lerp(yscale, 1, _qtd);
}

function desenha_efeito_mola()
{
    draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha)
}
