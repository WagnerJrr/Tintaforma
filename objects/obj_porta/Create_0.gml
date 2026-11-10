//variaveis
velv = 0.5

aberta = false

//ps_porta_abrir
ps = part_system_create();
part_system_draw_order(ps, true);

//Emitter
ptype1 = part_type_create();
part_type_shape(ptype1, pt_shape_smoke);
part_type_size(ptype1, 1, 1, 0.05, 0);
part_type_scale(ptype1, 0.1, 0.1);
part_type_speed(ptype1, 0.1, 0.1, 0.005, 0);
part_type_direction(ptype1, 0, 201, 0, 0);
part_type_gravity(ptype1, 0, 270);
part_type_orientation(ptype1, 0, 0, 0, 0, false);
part_type_colour3(ptype1, $4C4C4C, $333333, $000000);
part_type_alpha3(ptype1, 1, 1, 1);
part_type_blend(ptype1, true);
part_type_life(ptype1, 30, 45);

//funções

//minha porta esta parada
estado_parado = function () {
    
}

//começou a abrir
estado_abrindo = function () {
    
    //velocidade v diminui para a porta subir
    y -= velv
    
    //treme a tela
    screenshake(3)
    
    //mexendo enquanto abro
    x = xstart + random_range(-0.5, 0.5)
    
    //criando sistema de particula se ele nao existe
    //if(!part_system_exists(ps))
    //{
        //ps = part_system_create(ps_porta_abrir)
        //
        ////colocando ele na posição correta
        //part_system_position(ps, x, y)
    //}
    
    //criando a minha particula manualmente
    part_particles_create(ps, x, y - 16, ptype1, 1)
    
    
    //se o estado dela era fechado ele excuta o código
    if(!aberta) 
    {
        //usa a chave e muda estado 
        global.contador_chave -= 1
        aberta = true
    }
    
    //se saiu da room me destruo
    if(y < 0) 
    {
        //apagando particula
        part_system_destroy(ps)
        
        estado_aberta()
    }
}

estado_aberta = function () {
    instance_destroy()
    aberta = false
}

estado = estado_parado;