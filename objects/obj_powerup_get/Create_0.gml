explosao = function ()
{
    repeat(1)
    {
        var _part = instance_create_layer(x, y, "enfeite", obj_particula_powerup)
        
        _part.speed = random_range(0.5, 2)
        _part.direction = random_range(0, 359)
    }
}