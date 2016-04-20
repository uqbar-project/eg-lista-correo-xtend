package ar.edu.listaCorreoDecorada.listas

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ListaCorreoImpl implements ListaCorreo {
	List<Miembro> miembros = new ArrayList<Miembro>()
	
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
		val destinatarios = miembros.filter([Miembro miembro | !miembro.esRemitente(post)])
		for(Miembro miembro : destinatarios) {
			miembro.enviar(post)
		}	
	}
	
}