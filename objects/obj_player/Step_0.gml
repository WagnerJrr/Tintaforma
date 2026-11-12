#region movimento

pega_input();
checa_chao();
movimento();
ajusta_escala();
ativa_debug();

retorna_mola();

//var _brilho = instance_place(x + velh, y, obj_powerup)
//
//if(_brilho)
//{
    //muda_brilho();
//}

volta_brilho();

//rodando maquina de estado
estado();

#endregion

