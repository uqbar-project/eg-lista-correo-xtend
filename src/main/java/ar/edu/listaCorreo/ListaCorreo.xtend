package ar.edu.listaCorreo

import ar.edu.listaCorreo.observers.PostObserver
import ar.edu.listaCorreo.suscripcion.SuscripcionAbierta
import ar.edu.listaCorreo.suscripcion.SuscripcionCerrada
import ar.edu.listaCorreo.suscripcion.TipoSuscripcion
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ListaCorreo {

	List<Miembro> miembros
	TipoEnvio tipoEnvio
	List<PostObserver> postObservers
	String encabezado
	TipoSuscripcion tipoSuscripcion

	/**
	 * CONSTRUCTORES
	 *  
	 */
	/** Constructor default: toda lista es abierta */
	new() {
		miembros = new ArrayList<Miembro>
		tipoEnvio = new EnvioAbierto
		postObservers = new ArrayList<PostObserver>
		tipoSuscripcion = new SuscripcionAbierta
	}

	def static ListaCorreo listaSuscripcionAbierta() {
		new ListaCorreo
	}

	def static ListaCorreo listaSuscripcionCerrada() {
		new ListaCorreo => [
			tipoEnvio = new EnvioRestringido
			tipoSuscripcion = new SuscripcionCerrada
		]
	}

	def static ListaCorreo listaEnvioAbierto() {
		new ListaCorreo
	}

	def static ListaCorreo listaEnvioRestringido() {
		new ListaCorreo => [
			tipoEnvio = new EnvioRestringido
			tipoSuscripcion = new SuscripcionCerrada
		]
	}

	/** 
	 * CASO DE USO: Suscripción
	 *  
	 **/
	def suscribir(Miembro miembro) {
		tipoSuscripcion.suscribir(miembro, this)
	}

//  otra decisión de diseño podría ser no obligar a la lista abierta a aprobar suscripción
//  pero eso complica al test porque tiene que acceder al strategy 		
	def aprobarSuscripcion(Miembro miembro) {
		tipoSuscripcion.aprobarSuscripcion(miembro, this)
	}

	def void agregarMiembro(Miembro miembro) {
		miembros.add(miembro)
	}

	/** 
	 * CASO DE USO: Envío de post
	 *  
	 **/
	def void recibirPost(Post post) {
		tipoEnvio.validarEnvio(post, this)
		post.enviarMail
		postObservers.forEach[sender|sender.send(post, this)]
	}

	def void agregarPostObserver(PostObserver postObserver) {
		postObservers.add(postObserver)
	}

	def eliminarPostObservers() {
		postObservers.clear
	}

	def Iterable<Miembro> getDestinatarios(Post post) {
		miembros.filter[miembro|!miembro.equals(post.emisor)]
	}

	def getMailsDestino(Post post) {
		getDestinatarios(post).map[miembro|miembro.mail]
	}

	def boolean estaSuscripto(Miembro miembro) {
		miembros.contains(miembro)
	}

}
