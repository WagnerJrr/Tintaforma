#region variaveis

//variaveis de movimento
velh = 0;
max_velh = 1;

velv = 0;
max_velv = 4;

//gravidade
grav = 0.2;

//variaveis do level
chao = false;

//variaveis de input
right = 0;
left = 0;
jump = 0;

#endregion

#region metodos

//coletando inputs
pega_input = function()
{
    right = keyboard_check(ord("D")) or keyboard_check(vk_right);
    left = keyboard_check(ord("A")) or keyboard_check(vk_left);
    jump = keyboard_check_pressed(vk_space);
}

//checa chao
checa_chao = function()
{
    chao = place_meeting(x, y+1, obj_parede);
}

//metodo de movimentação
movimento = function()
{
    //aplicando os inputs na velh
    velh = (right - left) * max_velh;
    
    //aplicando a gravidade
    //se nao estou tocando no chao aplico a grav na velv
    //se estou, zero a velv
    if(!chao)
    {
        velv += grav
    }
    else 
    {
        velv = 0	
        
        //pulando
        if(jump)
        {
            velv = -max_velv
        }
    }
    
    //usando o move and colide para colisão horizontal
    move_and_collide(velh, 0, obj_parede, 24);
    
    //mv and colide para colisao vertical
    move_and_collide(0, velv, obj_parede, 24);
}

#endregion