class Armas {
  method valorDeAtaque()

}

class Filo inherits Armas {
  var longitud 
  var filo 
  override method valorDeAtaque() {
    return filo * longitud 
  }

}

class Contundentes inherits Armas {
  const peso
  override method valorDeAtaque() {
    return peso
  }
}

class Armadura {
  method puntosArmadura(gladiador) {}
}

class Escudo inherits Armadura {
  override method puntosArmadura(gladiador) {
    return 5 + (gladiador.destreza() * 0.1)
  }
}

class Casco inherits Armadura {
  override method puntosArmadura(gladiador) {
    return 10
  }
}

class Gladiadores {
  var vida = 100
  method atacar(unGladiador) {
    unGladiador.recibirDaño(self)
  }
  method defensa() 
  method poderDeAtaque()
  method recibirDaño(unGladiador) {
    vida= vida - (unGladiador.poderDeAtaque() - self.defensa())
  }
  method pelea(unGladiador) {
    self.atacar(unGladiador)
    unGladiador.atacar(self)
  }
  method vida() {
    return vida
  }
}

class Mirmillones inherits Gladiadores {
  var arma
  var armadura
  var fuerza
  method destreza() {
    return 15 
  }
  method cambiarDeArmadura(unaArmadura) {
    armadura= unaArmadura
  }
  method cambiaArma(unArma) {
    arma= unArma
  }
  method cambiarFuerza(nFuerza){
    fuerza = nFuerza
  }
  override method poderDeAtaque() {
    return arma.poderDeAtaque() + fuerza
  }
  override method defensa() {
    return armadura.puntosArmadura(self) + self.destreza()
  }
}

class Dimachaerus inherits Gladiadores{
  var destreza
  const armas= []
  method fuerza() {
    return 10
  }
  method poderDeListaDeArmas() {
    return armas.sum({unArma => unArma.valorDeAtaque()})
  }
  override method poderDeAtaque() {
    return self.poderDeListaDeArmas() + self.fuerza()
  }
  method destreza() {
    return destreza
  }
  method cambiarDestreza() {
    destreza = destreza + 1
  }
  method agregarArma(unArma) {
    armas.add(unArma)
  }
  override method atacar(unGladiador){
    super(unGladiador)
    self.cambiarDestreza()
  }
  override method defensa() {
    return destreza / 2
  }
}

class Grupo{
  const nombre
  var cantPeleas
  const miembros= []

  method agregarMiembro(unGladiador) {
    miembros.add(unGladiador)
  }
  method quitarMiembre(unGladiador) {
    miembros.remove(unGladiador)
  }

  method campeon() {
   return miembros.max({unMiembro => unMiembro.fuerza() and self.tienePuntosDeVidaDisponibles(unMiembro)})
  }

  method tienePuntosDeVidaDisponibles(unGladiador) {
    return unGladiador.vida() > 0
  }

  method pelea(otroGrupo) {
    self.campeon().atacar(otroGrupo.campeon())
  }
}

// for en wollok 
// method ejecutarNVeces(){
//    (1.3).forEach({e => self.pelear(gladiador1, gladiador2)})
//}

