import combustibleYcolor.*

object ferrari {
  /*La Ferrari
  - Tiene un motor que inicialmente está funcionando en un 87% (puede oscilar entre 0 y 100%).
  - Está en condiciones para correr si el motor está funcionando en al menos un 65%.
  - Al reparar el motor, queda funcionando al 100%.
  - Su velocidad máxima es 110 km/s, más 15 km/s adicionales si el motor está funcionando por encima del 75%.
  - En una prueba de velocidad, el motor se daña disminuyendo en 30 unidades su nivel de funcionamiento actual.*/

  var property motorFuncionando = 87

  
  method estaEnCondiciones() = motorFuncionando >= 65
  
  method reparar() {
    motorFuncionando = 100
  }
  
  method velocidadMaxima() {
    if(motorFuncionando > 75){
      return 110 + 15
    }
    return 110
  }

  method pruebaDeVelocidad() {
    motorFuncionando = 0.max(motorFuncionando - 30)
  }

}

object intocable {
  /*El intocable
  - A veces está en condiciones y otras no; puede variar.
  - La prueba de velocidad lo deja fuera de condiciones.
  - Cuando lo reparan, queda nuevamente en condiciones de correr.
  - Tiene una velocidad máxima fija de 45.*/

  var condicionDeMotor = false
  method estaEnCondiciones() = condicionDeMotor

  method reparar() {
   condicionDeMotor = true
  }
  
  method velocidadMaxima() = 45

  method pruebaDeVelocidad() {
    condicionDeMotor = false
  }
}

object rubi {
  /*La flecha rubí
    - Tiene un nivel de combustible inicial de 100 litros.  
    - Inicialmente utiliza gasolina, pero puede cambiar su combustible por nafta o nitrógeno líquido.
    - El color inicial es azul.*/
  var combustibleQueUsa = gasolina
  var property nivelDeConbustible = 100
  var property color = azul

  method estaEnCondiciones() {
    /*Condiciones para correr:
    - Tiene más de 85 litros de gasolina o 50 litros de nafta.
    - En caso de tener nitrógeno líquido, alcanza con que no esté totalmente vacío.
    - Además, para poder correr debe estar pintado de rojo.*/
    return combustibleQueUsa.estaEnCondiciones(nivelDeConbustible) && color.sirveParaCorrer()
  }
  
  
  method reparar() {
    /*Reparación en el taller:
      - Se duplica la cantidad de combustible que tenga.
      - Se cambia el color del auto:
      - Rojo → Azul
      - Azul → Verde
      - Verde → Rojo
    */
    nivelDeConbustible = nivelDeConbustible * 2
    color = color.cambiarColor()
  }
  
  method pruebaDeVelocidad() {
    /*Prueba de velocidad:
      - El auto consume 5 litros del combustible que sea.*/
    nivelDeConbustible = 0.max(nivelDeConbustible - 5)
  }

  method velocidadMaxima() {
    /*Velocidad máxima:
      - Es el doble de los litros de combustible que tenga.
      - Además:
        -Si es gasolina, se le agregan 10 km/s.
        -Si es nafta, se pierde un 10%.
        -Si es nitrógeno líquido, se multiplica por 10.
    */
    return combustibleQueUsa.nivelDeConbustibleEnVelocidadMaxima(nivelDeConbustible * 2 )
  }

  method cambiarCombustible(combustible){
    combustibleQueUsa = combustible
  }
  

}