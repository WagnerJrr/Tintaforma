if(!alvo) exit

//me esticando
image_xscale = lerp(image_xscale, speed *4, 0.1);
image_angle = direction

if(voltar == false)
{
    //isso só roda se tenho alvo
    //perdendo velocidade
    
    //se nao estou voltando diminuo a velocidade
    speed -= 0.05;
    
    //se velocidade chegar 0 mudo o valor da variavel
    if(speed <= 0)
    {
        voltar = true
        
        //defininfo direçaõ aqui pq esse código roda uma vez só 
        //define diração de retorno 
        //deixando a direção meio aleatoria 
        var _x = alvo.x + random_range(-5, 5); 
        var _y = alvo.y -12 + random_range(-4, 3);
        
        var _dir = point_direction(x, y, _x, _y); 
        direction = _dir;
    }
}
//se nao
else
{
    //aumenta velocidade
    speed += 0.05
    
    var _player = instance_place(x, y, obj_player)
    
    //se colidir com o player me destruo e desenho efeito
    if(_player)
    {
        //com with o código roda dentro do player
        with(_player)
        {
            efeito_mola(1.1, 1.2);
        }
        
        instance_destroy();
    }
}