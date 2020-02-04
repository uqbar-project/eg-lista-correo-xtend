package ar.edu.listaCorreoDecorada.listas

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ListaCorreoImpl implements ListaCorreo {
	List<Miembro> miembros = new ArrayList<Miembro>()
	
	override void suscribir(Miembro miembro) {
		this.agregarMiembro(miembro)
	}
	
	override agregarMiembro(Miembro miembro) {
		this.miembros.add(miembro)
	}
	
	override remitentePertenece(Post post) {
		return miembros.exists([Miembro miembro | miembro.esRemitente(post)])
	}
	
	override void enviar(Post post) {
		val destinatarios = miembros.filter([Miembro miembro | !miembro.esRemitente(post)])
		destinatarios.forEach [ miembro | miembro.enviar(post) ]
	}
	
}