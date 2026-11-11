#region movimento

pega_input();
checa_chao();
movimento();
ajusta_escala();
ativa_debug();

retorna_mola();

if(keyboard_check(ord("B")))
{
    cor_brilho = c_white
}
else if(keyboard_check(ord("C")))
{
    cor_brilho = c_grey
}
else if(keyboard_check(ord("Y")))
{
    cor_brilho = c_yellow
}
else if(keyboard_check(ord("K")))
{
    alfa_brilho = 1
}

alfa_brilho = lerp(alfa_brilho, 0, .1)

//rodando maquina de estado
estado();

#endregion

