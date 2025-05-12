import autos.*

object dominic {
  /*
    Dominic cuenta con muchos autos. Hace pruebas de velocidad y busca los mejores para las carreras. 
    Tiene un taller donde pone en condiciones los autos que tienen problemas.

    Las acciones que se realizan son:
      - Dominic compra (o consigue) autos, que pasan a ser suyos.
      - Encontrar cuáles de sus autos no están en condiciones para correr y mandarlos a su taller.
      - Cuando se trabaja en el taller, se reparan todos los autos que haya allí.
      - Dominic hace pruebas de velocidad en todos sus autos, lo que eventualmente podría afectar la disponibilidad de los autos para la próxima carrera.
      - Al final de la temporada vende todos sus vehículos.
    En cualquier momento se quiere averiguar:
      - El promedio de velocidades máximas de todos sus autos, estén en condiciones o no.
      - El auto más rápido que tiene, entre los que están en condiciones de correr.
      - Si la velocidad del auto más rápido es más del doble que el promedio de velocidades máximas de todos los autos.
    */

    const autos = #{}
    method autos() = autos

    method comprarAuto(auto) {
      autos.add(auto)
    }

    method autosNoEnCondiciones() {
      return autos.filter({a => !a.estaEnCondiciones()})
    }

    method enviarATaller(){
      taller.recibirAutos(self.autosNoEnCondiciones())
    }
    
    method pruebaDeVelocidad() {
      /* Dominic hace pruebas de velocidad en todos sus autos,
       lo que eventualmente podría afectar la disponibilidad de los autos para la próxima carrera.*/
      autos.forEach({
        a => a.pruebaDeVelocidad()
      })  
    }

    method venderTodosLosAutos() {
      autos.clear()
    }

    method promedioDeVelocidadMaxima() {
      /*El promedio de velocidades máximas de todos sus autos, estén en condiciones o no.*/
      return autos.sum({a => a.velocidadMaxima()}) / autos.size() 
    }

    method autoMasRapidoEnCondiciones() {
      /*El auto más rápido que tiene, entre los que están en condiciones de correr.*/
      return (autos.filter({a => a.estaEnCondiciones()})).max({a => a.velocidadMaxima()})
    }

    method velocidadMaxEsMayorAlDobleDelPromedio() {
      /*Si la velocidad del auto más rápido es más del doble que el promedio de velocidades máximas de todos los autos.*/
      /*Se toma como auto mas rapido entre los que estan en condiciones*/
      return  self.autoMasRapidoEnCondiciones().velocidadMaxima() > (2 * self.promedioDeVelocidadMaxima())
    }

    method velocidadMaxEsMayorAlDobleDelPromedio2() {
      /*Si la velocidad del auto más rápido es más del doble que el promedio de velocidades máximas de todos los autos.*/
      /*Se toma como auto mas rapido entre todos los autos*/
      return  (autos.max({a => a.velocidadMaxima()})).velocidadMaxima() > (2 * self.promedioDeVelocidadMaxima())
    }

}

object taller {
  const autosAReparar = #{}
  method autosAReparar() = autosAReparar 

  method recibirAutos(autos) {
    autosAReparar.addAll(autos)
  }
  
  method reparaAutos() {
    autosAReparar.forEach({
      a => a.reparar()
    })  

    autosAReparar.clear()
  }
}