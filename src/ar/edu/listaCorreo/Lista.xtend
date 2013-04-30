package ar.edu.listaCorreo

import java.util.ArrayList
import java.util.List
import ar.edu.listaCorreo.observers.PostObserver
import ar.edu.listaCorreo.suscripcion.TipoSuscripcion
import ar.edu.listaCorreo.suscripcion.SuscripcionAbierta
import ar.edu.listaCorreo.suscripcion.SuscripcionCerrada

class Lista {
	@Property List<Miembro> miembros
	@Property TipoEnvio tipoEnvio
	@Property List<PostObserver> postObservers
	@Property String encabezado
	@Property TipoSuscripcion tipoSuscripcion
	
	def static Lista listaAbierta() {
		new Lista
	}	

	def static Lista listaCerrada() {
		var lista = new Lista
		lista.tipoEnvio = new ListaRestringida
		lista.tipoSuscripcion = new SuscripcionCerrada
		lista
	}	

	def suscribir(Miembro miembro)  {
		tipoSuscripcion.suscribir(miembro, this)
	}
		
	def aprobarSuscripcion(Miembro miembro)  {
		tipoSuscripcion.aprobarSuscripcion(miembro, this)
	}
	
	/** Constructor, por default toda lista es abierta */
	new() {
		miembros = new ArrayList<Miembro>
		tipoEnvio = new ListaAbierta
		postObservers = new ArrayList<PostObserver>
		tipoSuscripcion = new SuscripcionAbierta
	}
	
	def void agregarMiembro(Miembro miembro) {
		miembros.add(miembro)
	}
	
	def void agregarPostObserver(PostObserver postObserver) {
		postObservers.add(postObserver)
	}
	
	def void enviar(Post post) {
		tipoEnvio.validarEnvio(post, this)
		postObservers.forEach [ sender | sender.send(post) ]
	}
	
	def Iterable<Miembro> getDestinatarios(Post post) {
		miembros.filter [ miembro | !miembro.equals(post.emisor) ]
	}
	
	def getMailsDestino(Post post) {
		getDestinatarios(post).map [ miembro | miembro.mail ]
	}
	
	def boolean estaSuscripto(Miembro miembro) {
		miembros.contains(miembro)	
	}
	
}