#region variaveis

//variaveis de movimento
velh =      0;
max_velh =  1;

velv =      0;
max_velv =  4;

//gravidade
grav =      0.2;

//variaveis do level
chao =      false;

//variaveis de input
right =     0;
left =      0;
jump =      0;

//estados
estado = noone;

#endregion

#region metodos

//Coletando inputs-----
pega_input = function()
{
    right = keyboard_check(ord("D")) or keyboard_check(vk_right);
    left = keyboard_check(ord("A")) or keyboard_check(vk_left);
    jump = keyboard_check_pressed(vk_space);
    debug_ative = keyboard_check_pressed(vk_tab);
}


//Checa chao-----
checa_chao = function()
{
    chao = place_meeting(x, y+1, obj_parede);
}

//Maquina de estado-----
estado_parado = function()
{
    image_blend = c_red;
    sprite_index = spr_player_idle
}

estado_movendo = function()
{
    image_blend = c_blue;
    sprite_index = spr_correr
}

estado_pulo = function()
{
    image_blend = c_yellow;
}

maquina_estado = function()
{
    if(velh==0 and velv==0)
    {
        estado = estado_parado()
    }
    else if(velh >= 0.5 or velh <= -0.5)
    {
        estado = estado_movendo();
    }
    else if(velv <= 0.5)
    {
        estado = estado_pulo()
    }
}


//Metodo de movimentação-----
movimento = function()
{
    //aplicando os inputs na velh
    velh = (right - left) * max_velh;
    
    //olha para adireção que esta se movendo
    if(left)
    {
        image_xscale = -1
    }
    else if(right)
    {
        image_xscale = 1
    }
    
    //aplicando a gravidade
    //se nao estou tocando no chao aplico a grav na velv
    //se estou, zero a velv
    if(!chao)
    {
        velv += grav;
    }
    else 
    {
        velv = 0;
        
        //arredondando posição do y do player para que ele não entre no chao
        y=  round(y);
        
        //pulando
        if(jump)
        {
            velv = -max_velv;
        }
    }
    
    //usando o move and colide para colisão horizontal
    move_and_collide(velh, 0, obj_parede, 24);
    
    //mv and colide para colisao vertical
    move_and_collide(0, velv, obj_parede, 24);
}

view_player = noone

//Metodo de debug-----
roda_debug = function()
{
    //se nao ta com debug ativado, retorna
    //if(!global.debug) return
        
    show_debug_overlay(1);

    //criando os itens de debug dentro do view
    view_player = dbg_view("Views player", 1, 60, 80, 350, 400);
    
    //vendo informações da velv
    var _ref_velv = ref_create(id, "velv");
    var _ref_max_velv = ref_create(id, "max_velv");
    var _ref_grav = ref_create(id, "grav");
    
    dbg_watch(_ref_velv, "Velv");
    
    //habilitando slider para mudar o max-velv dele
    dbg_slider(_ref_max_velv, 0, 10, "max_velv", 0.5);
    
    //slider para gravidade
    dbg_slider(_ref_grav, 0, 10, "Grav", 0.1);
}

ativa_debug = function()
{
    //Só rodo se o jogo ta no modo debug
    if(!DEBUG_MODE) return
    
    //alterando o modo debug
    if(debug_ative)
    {
        //se for true vira false, e se for false vira true
        global.debug = !global.debug;
        
        //se o jogo esta em moo debug roda debug
        if(global.debug)
        {
            roda_debug();
        }
        else
        {
            //desativo o debug overlay
            show_debug_overlay(0)
            
            //se a view existe e eu nao estou no modo debug eu deleto ela
            if(dbg_view_exists(view_player))
            {
                dbg_view_delete(view_player)
            }
        }
    }
}

#endregion

//Definindo estado atual do player
estado = estado_parado;