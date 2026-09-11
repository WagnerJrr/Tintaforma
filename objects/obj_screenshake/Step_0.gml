//tremendo a tela
if(treme != 0)
{
    var _x = random_range(-treme, treme)
    var _y = random_range(-treme, treme)
    
    //alternando a posição x e y do viewport
    view_set_xport(view_current, _x);
    view_set_yport(view_current, _y);
}
else //cheguei perto de zero eu zero o valor do treme
{
    treme = 0;
    
    //zerando posições x e y
    view_set_xport(view_current, 0);
    view_set_yport(view_current, 0);
}

treme = lerp(treme, 0, .1)