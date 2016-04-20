package ar.edu.listaCorreoEnvioBloques.listas

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ListaCorreo {
	ModoSuscripcion modoSuscripcion
	EnvioValidator validator
	List<Miembro> miembros = new ArrayList<Miembro>()
	
	def void suscribir(Miembro miembro) {
		modoSuscripcion.suscribir(miembro)
	}
	
	def agregarMiembro(Miembro miembro) {
		this.miembros.add(miembro)
	}
	
	def remitentePertenece(Post post) {
		miembros.exists([Miembro miembro | miembro.esRemitente(post)])
	}
	
	def void enviar(Post post) {
		this.validator.validate(post, this)
		val destinatarios = miembros.filter([Miembro miembro | !miembro.esRemitente(post)])
		for(Miembro miembro : destinatarios) {
			miembro.enviar(post)
		}	
	}
	
}