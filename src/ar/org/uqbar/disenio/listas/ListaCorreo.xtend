package ar.org.uqbar.disenio.listas

import java.util.ArrayList

class ListaCorreo {
	@Property ModoSuscripcion modoSuscripcion
	@Property EnvioValidator validator
	@Property var miembros = new ArrayList<Miembro>()
	
	def void suscribir(Miembro miembro) {
		modoSuscripcion.suscribir(miembro)
	}
	
	def agregarMiembro(Miembro miembro) {
		this.miembros.add(miembro)
	}
	
	def remitentePertenece(Post post) {
		return miembros.exists([Miembro miembro | miembro.esRemitente(post)])
	}
	
	def void enviar(Post post) {
		this.validator.validate(post, this)
		var destinatarios = miembros.filter([Miembro miembro | !miembro.esRemitente(post)])
		for(Miembro miembro : destinatarios) {
			miembro.enviar(post)
		}	
	}
	
}