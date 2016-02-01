package ar.edu.listaCorreoEnvioBloques.listas

class ModoAbierto extends ModoSuscripcion {
	
	override suscribir(Miembro miembro) {
		this.lista.agregarMiembro(miembro)
	}
	
}