package ar.org.uqbar.disenio.listas.decorator

import java.util.ArrayList

class ListaCorreoImpl implements ListaCorreo {
	@Property var miembros = new ArrayList<Miembro>()
	
	override def void suscribir(Miembro miembro) {
		this.agregarMiembro(miembro)
	}
	
	override def agregarMiembro(Miembro miembro) {
		this.miembros.add(miembro)
	}
	
	override def remitentePertenece(Post post) {
		return miembros.exists([Miembro miembro | miembro.esRemitente(post)])
	}
	
	override def void enviar(Post post) {
		var destinatarios = miembros.filter([Miembro miembro | !miembro.esRemitente(post)])
		for(Miembro miembro : destinatarios) {
			miembro.enviar(post)
		}	
	}
	
}