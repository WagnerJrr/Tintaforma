estado = noone

//meu dado vai começar parado
estado_seta_comeco = function()
{
    //vel da imagem zerada
    image_speed = 0
    
    //voltando colisao
    mask_index = sprite_index
    
    //alarm só roda se ele for igual ou menor que zero
    if(alarm[0] <= 0) alarm[0] = tempo
}

estado_seta_roda = function()
{
    image_speed = 1
    
    if(image_index >= 8 and image_index <= 9)
    {
        estado = estado_seta_parada;
    }
}

//meu dado vai começar parado
estado_seta_parada = function()
{
    //vel da imagem zerada
    image_speed = 0
    image_index = 8
    
    //tirando colisao
    mask_index = spr_semcolisao
    
    //alarm só roda se ele for igual ou menor que zero
    if(alarm[1] <= 0) alarm[1] = tempo
}

//meu dado vai começar parado
estado_seta_roda2 = function()
{
    image_speed = 1
    
    if(image_index >= 16)
    {
        estado = estado_seta_comeco;
    }
}

//definindo estado inicial dos dados
if(estado_inicial == "estado_seta_parada")
{
    estado = estado_seta_parada;
}
else 
{
    estado = estado_seta_comeco; 	
}