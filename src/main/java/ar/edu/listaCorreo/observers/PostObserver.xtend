package ar.edu.listaCorreo.observers

import ar.edu.listaCorreo.ListaCorreo
import ar.edu.listaCorreo.Post
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

interface PostObserver {
	
	def void send(Post post, ListaCorreo lista)
	
}

class MailObserver implements PostObserver {
	MessageSender messageSender

	new(MessageSender _messageSender) {
		messageSender = _messageSender
	}

	override send(Post post, ListaCorreo lista) {
		lista.getMailsDestino(post).forEach [ mailDestino |
			val mail = new Mail => [
				from = post.emisor.mail
				titulo = "[" + lista.encabezado + "] nuevo post"
				message = post.mensaje
				to = mailDestino
			]
			messageSender.send(mail)
		]
	}

}

class BloqueoUsuarioVerbosoObserver implements PostObserver {
	
	override send(Post post, ListaCorreo lista) {
		val emisor = post.emisor
		if (emisor.envioMuchosMensajes) {
			emisor.bloquear			
		}
	}
	
}

class MalasPalabrasObserver implements PostObserver {

	List<String> malasPalabras = newArrayList
	@Accessors(PUBLIC_GETTER) List<Post> postConMalasPalabras = newArrayList

	override send(Post post, ListaCorreo lista) {
		if (tieneMalasPalabras(post)) {
			//println("Mensaje enviado a admin por mensaje con malas palabras: " + post.mensaje)
			postConMalasPalabras.add(post)
		}
	}

	def boolean tieneMalasPalabras(Post post) {
		malasPalabras.exists [ malaPalabra | post.tiene(malaPalabra) ]
	}

	def void agregarMalaPalabra(String palabra) {
		malasPalabras.add(palabra)
	}

}
