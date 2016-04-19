package ar.edu.listaCorreoMailSingleton

import ar.edu.listaCorreoMailSingleton.observers.PostObserver
import ar.edu.listaCorreoMailSingleton.suscripcion.SuscripcionAbierta
import ar.edu.listaCorreoMailSingleton.suscripcion.SuscripcionCerrada
import ar.edu.listaCorreoMailSingleton.suscripcion.TipoSuscripcion
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Lista {
	List<Miembro> miembros
	TipoEnvio tipoEnvio
	List<PostObserver> postObservers
	String encabezado
	TipoSuscripcion tipoSuscripcion
	
	/**
	 * CONSTRUCTORES
	 
	 */
	 
	/** Constructor default: toda lista es abierta */
	new() {
		miembros = new ArrayList<Miembro>
		tipoEnvio = new ListaAbierta
		postObservers = new ArrayList<PostObserver>
		tipoSuscripcion = new SuscripcionAbierta
	}
	
	def static Lista listaAbierta() {
		new Lista
	}	

	def static Lista listaCerrada() {
		new Lista => [
			tipoEnvio = new ListaRestringida
			tipoSuscripcion = new SuscripcionCerrada
		]
	}	

	/** 
	 * CASO DE USO: Suscripción
	 *  
	 **/
	def suscribir(Miembro miembro)  {
		tipoSuscripcion.suscribir(miembro, this)
	}
	
//  otra decisión de diseño podría ser no obligar a la lista abierta a aprobar suscripción
//  pero eso complica al test porque tiene que acceder al strategy 		
	def aprobarSuscripcion(Miembro miembro)  {
		tipoSuscripcion.aprobarSuscripcion(miembro, this)
	}
	
	def void agregarMiembro(Miembro miembro) {
		miembros.add(miembro)
	}

	/** 
	 * CASO DE USO: Envío de post
	 *  
	 **/
	def void enviar(Post post) {
		tipoEnvio.validarEnvio(post, this)
		postObservers.forEach [ sender | sender.send(post) ]
	}
	
	def void agregarPostObserver(PostObserver postObserver) {
		postObservers.add(postObserver)
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