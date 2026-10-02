if(alvo)
{
    image_alpha -= 0.01
    obj_player.powerup = true;
    
    if(image_alpha <= 0)
    {
        instance_destroy()
    }
}