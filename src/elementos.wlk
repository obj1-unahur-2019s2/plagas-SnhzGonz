import plagas.*


class Hogar {
	var property nivelDeMugre
	var property confortQueOfrece
	
	method esBueno() {
		return nivelDeMugre <= confortQueOfrece / 2
	}
	method recibeAtaque(plaga){
		nivelDeMugre += plaga.nivelDeDanio()
	}
}
object nivelDeProduccion {
	var property nivel = 200
	method nivelDeProduccion(){
		return nivel
	}
}
class Huerta {
	var property capacidadDeProduccion
	
	method esBueno(){
		return capacidadDeProduccion > nivelDeProduccion.nivel()
	}
	method recibeAtaque(plaga){
		 capacidadDeProduccion -= plaga.nivelDeDanio() * 0.90
		 if (plaga.transmiteEnfermedades()){capacidadDeProduccion -= 10}		 
	}
}

class Mascota {
	var property nivelDeSalud
	
	method esBueno(){
		return nivelDeSalud > 250
	}
	method recibeAtaque(plaga){
		if(plaga.transmiteEnfermedades()){nivelDeSalud = 0.max(nivelDeSalud - plaga.nivelDeDanio())}
	}
}

class Barrio {
	const barrio = []
	method sumarAlBarrio(elementos){barrio.add(elementos)}
	method restarAlBarrio(elementos){barrio.remove(elementos)}
	
	method barrioCopado(){
		return self.elementosBuenos().size() > self.elementosMalos().size()
	}
	method elementosBuenos(){
		return barrio.filter{b => b.esBueno()}
	}
	method elementosMalos(){
		return barrio.filter{b => not b.esBueno()}
	}
}