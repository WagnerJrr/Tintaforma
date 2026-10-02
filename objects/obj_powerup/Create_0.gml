//identificando quem é o player
alvo = noone

//indo para a cabeça do player
movendo = function()
{
    //se nao tiver alvo retorna
    if(!alvo) return;
        
    //só roda se tenho alvo
    x = alvo.x;
    y = alvo.y - 34
}

explosao = function ()
{
    repeat(40)
    {
        var _part = instance_create_depth(x, y, depth - 1, obj_particula_powerup);
        
        _part.vspeed = irandom_range(2, 4);
        _part.direction = irandom_range(0, 359);
        
        _part.alvo = alvo;
    }
}