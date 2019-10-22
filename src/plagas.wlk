import elementos.*

class Plagas {
	var property poblacion = 0

	method transmiteEnfermedades(){return poblacion >= 10}
	method ataque(elemento){
		elemento.recibirAtaque(self)
		poblacion = poblacion * 1.10
	}
}

class Cucarachas inherits Plagas {
	var property pesoPromedio
	override method transmiteEnfermedades(){
		return pesoPromedio > 10 and super()
	}
	method nivelDeDanio(){return poblacion / 2}
	override method ataque(elemento){
		pesoPromedio += 2 ; super(elemento)
	}
}

class Pulgas inherits Plagas {
	method nivelDeDanio(){return poblacion * 2}
}

class Garrapatas inherits Plagas {
	method nivelDeDanio(){return poblacion * 2}
	override method ataque(elemento){
		elemento.recibirAtaque()
		poblacion = poblacion * 1.20
	}
}

class Mosquitos inherits Plagas {
	method nivelDeDanio(){return poblacion}
	override method transmiteEnfermedades(){
		return poblacion % 3 == 0 and super()
	}
}
