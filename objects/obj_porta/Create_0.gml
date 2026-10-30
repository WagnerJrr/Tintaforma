//variaveis
velv = 0.5

aberta = false
ps = noone

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
    if(!part_system_exists(ps))
    {
        ps = part_system_create(ps_porta_abrir)
        
        //colocando ele na posição correta
        part_system_position(ps, x, y)
    }
    
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
        estado_aberta()
    }
}

estado_aberta = function () {
    instance_destroy()
    aberta = false
}

estado = estado_parado;