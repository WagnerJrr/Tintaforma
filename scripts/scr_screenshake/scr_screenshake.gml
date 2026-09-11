//efeito screenshake
function screenshake(_treme = 1)
{
    //checando se a instancia do screenshake existe
    if(instance_exists(obj_screenshake))
    {
        //checando se o valor do treme atual é maior do que o valor do treme do objeto
        with (obj_screenshake) 
        {
            //se o valor do treme novo for maior que o meu atual, mudo o valor dele
        	if(_treme > treme)
            {
                treme = _treme
            }
        }
    }
}