package ar.org.uqbar.disenio.listas

class ModoAbierto extends ModoSuscripcion {
	
	override suscribir(Miembro miembro) {
		this.lista.agregarMiembro(miembro)
	}
	
}