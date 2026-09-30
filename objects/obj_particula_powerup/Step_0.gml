if(!alvo) exit

if(voltar == false)
{
    //isso só roda se tenho alvo
    //perdendo velocidade
    
    //se nao estou voltando diminuo a velocidade
    speed -= 0.05;
    
    //se velocidade chegar 0 mudo o valor da variavel
    if(speed <= 0)
    {
        voltar = true
    }
}
//se nao
else
{
    //aumenta velocidade
    speed += 0.05
    
    //define diração de retorno
    direction = point_direction(x, y, alvo.x, alvo.y)
}