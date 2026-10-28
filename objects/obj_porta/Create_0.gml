//variaveis
velv = 0

aberta = false

//funções

//minha porta esta parada
estado_parado = function () {
    velv = 0
}

//começou a abrir
estado_abrindo = function () {
    
    //velocidade v diminui para a porta subir
    velv = 1
    y -= velv
    
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