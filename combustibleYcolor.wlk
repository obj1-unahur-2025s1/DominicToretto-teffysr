object gasolina {

  method estaEnCondiciones(nivelDeConbustible) = nivelDeConbustible > 85

  method nivelDeConbustibleEnVelocidadMaxima(valor) {
    return valor + 10
  }
  
}

object nafta {

  method estaEnCondiciones(nivelDeConbustible) = nivelDeConbustible > 50
  
  method nivelDeConbustibleEnVelocidadMaxima(valor) {
    return  valor - (valor * 0.1)
  }

}

object nitrogeno {
  
  method estaEnCondiciones(nivelDeConbustible) = nivelDeConbustible > 0

  method nivelDeConbustibleEnVelocidadMaxima(valor) {
    return  valor * 10
  }

}
/***********************************************/
object azul {
  method cambiarColor() = verde
  method sirveParaCorrer() = false 
}

object verde {
  method cambiarColor() = rojo
  method sirveParaCorrer() = false
}

object rojo {
  method cambiarColor() = azul
  method sirveParaCorrer() = true
}