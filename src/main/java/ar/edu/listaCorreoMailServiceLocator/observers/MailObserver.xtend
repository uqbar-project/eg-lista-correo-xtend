package ar.edu.listaCorreoMailServiceLocator.observers

import ar.edu.listaCorreoMailServiceLocator.Post
import ar.edu.listaCorreoMailServiceLocator.config.ServiceLocator

class MailObserver implements PostObserver {
	
	override send(Post post) {
		val lista = post.destino
		lista.getMailsDestino(post).forEach [ mailDestino |
			val mail = new Mail => [
				from = post.emisor.mail
				titulo = "[" + lista.encabezado + "] nuevo post"
				message = post.mensaje
				to = mailDestino
			]
			// messageSender se obtiene del singleton ServiceLocator
			ServiceLocator.instance.messageSender.send(mail)
		]
	}

}
