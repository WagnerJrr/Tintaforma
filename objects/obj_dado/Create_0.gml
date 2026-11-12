//meu dado vai começar parado
estado_seta_comeco = function()
{
    //vel da imagem zerada
    image_speed = 0
    
    //alarm só roda se ele for igual ou menor que zero
    if(alarm <= 0) alarm[0] = FPS * 4
}

estado_seta_roda = function()
{
    image_speed = 1
}

estado = estado_seta_comeco;