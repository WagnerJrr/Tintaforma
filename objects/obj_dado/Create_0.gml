estado = noone

//meu dado vai começar parado
estado_seta_comeco = function()
{
    //vel da imagem zerada
    image_speed = 0
    
    //alarm só roda se ele for igual ou menor que zero
    if(alarm[0] <= 0) alarm[0] = FPS
}

estado_seta_roda = function()
{
    image_speed = 1
    
    if(image_index == 8)
    {
        estado = estado_seta_parada;
    }
}

//meu dado vai começar parado
estado_seta_parada = function()
{
    //vel da imagem zerada
    image_speed = 0
    
    //alarm só roda se ele for igual ou menor que zero
    if(alarm[1] <= 0) alarm[1] = FPS
}

//meu dado vai começar parado
estado_seta_roda2 = function()
{
    image_speed = 1
    
    if(image_index <= 1)
    {
        estado = estado_seta_comeco;
    }
}

estado = estado_seta_comeco;