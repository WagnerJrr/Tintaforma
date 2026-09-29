estado = estado_powerup_inicio;

//destroi ao colidir
instance_destroy(obj_powerup);

//cria um obj do power em cima do player
instance_create_depth(x, y - 30, depth - 1, obj_powerup_get)