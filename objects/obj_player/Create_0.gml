#region variaveis

//variaveis de movimento
velh = 0
max_velh = 1

//variaveis de input
right = 0;
left = 0;
jump = 0;

#endregion

#region metodos

//coletando inputs
pega_input = function()
{
    right = keyboard_check(ord("D")) or keyboard_check(vk_right);
    left = keyboard_check(ord("A")) or keyboard_check(vk_left);
    jump = keyboard_check(vk_space);
}

//metodo de movimentação
movimento = function()
{
    //aplicando os inputs na velh
    velh = (right - left) * max_velh
    
    x += velh
}

#endregion