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

//Metodo de movimentação-----
aplica_velocidade = function()
{
    checa_chao()
    
    //aplicando os inputs na velh
    velh = (right - left) * max_velh;
    
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
}

//movimento-----
movimento = function()
{
    //usando o move and colide para colisão horizontal
    move_and_collide(velh, 0, obj_parede, 24);
    
    //mv and colide para colisao vertical
    move_and_collide(0, velv, obj_parede, 24);
}

//Sprite-----
troca_sprite = function(spr1 = spr_player_idle)
{
    //checando se ainda nao estou com a sprite correta
    //definindo a sprite
    if(sprite_index != spr1)
    {
        sprite_index = spr1;
        //zero a animação
        image_index = 0;
    }
}

//troca_estado_powerup
acabou_animacao = function()
{
    //quando a animação acabar eu mudo de estado
    var _spd = sprite_get_speed(sprite_index) / FPS
    if(image_index + _spd >= image_number)
    {
        return true
    }
}

//Maquina de estado-----
estado_parado = function()
{
    troca_sprite(spr_player_idle);
    aplica_velocidade();
    
    //se eu andar mudo de estado
    if(right != left)
    {
       estado = estado_movendo; 
    }
    
    //se pulei mudo o estado
    if(jump)
    {
        estado = estado_pulo;
    }
    
    //se nao estou no chao estou no estado de pulo
    if(!chao)
    {
        estado = estado_pulo;
    }
}

estado_movendo = function()
{
    aplica_velocidade();
    troca_sprite(spr_correr);
    
    //se nao estou me movendo, estou parado
    if(velh ==0)
    {
        estado = estado_parado;
    }
    
    //se pulei mudo o estado
    if(jump)
    {
        estado = estado_pulo;
    }
    
    //olha para adireção que esta se movendo
    if(left)
    {
        image_xscale = -1;
    }
    else if(right)
    {
        image_xscale = 1;
    }
}

estado_pulo = function()
{
    aplica_velocidade();
    
    //se minha velv é menor que zero estou subindo, se não estou descendo
    if(velv < 0)
    {
        troca_sprite(spr_pulo);
    }
    else 
    {
        troca_sprite(spr_queda);
    }
    
    //se toquei no chao mudo para o estado parado
    if(chao)
    {
        estado = estado_parado;
    }
}

estado_powerup_inicio = function()
{
    troca_sprite(spr_powerup_inicio);
    
    if(acabou_animacao())
    {
        estado = estado_powerup_meio;
    }
}

estado_powerup_meio = function()
{
    troca_sprite(spr_powerup_meio);
    
    if(acabou_animacao())
    {
        estado = estado_powerup_final;
    }
}

estado_powerup_final = function()
{
    troca_sprite(spr_powerup_final);
    
    if(acabou_animacao())
    {
        estado = estado_parado;
    }
}

estado_entrando_tinta = function()
{
    troca_sprite(spr_tinta_entrar);
    
    if(acabou_animacao())
    {
        estado = estado_parado;
    }
}

estado_saindo_tinta = function()
{
    troca_sprite(spr_tinta_sair)
    
    if(acabou_animacao())
    {
        estado = estado_parado;
    }
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
estado = estado_saindo_tinta;