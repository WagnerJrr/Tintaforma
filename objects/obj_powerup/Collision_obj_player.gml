//se ele aina nao é alvo
if(alvo == noone)
{
    //colocando o estado do player nos estado correto
    other.pega_powerup();
    
    //avisando que o player é meu alvo
    alvo = other.id;
    
    movendo();
    explosao();
}