package ar.edu.listaCorreo.observers

import ar.edu.listaCorreo.Post
import ar.edu.listaCorreo.config.ServiceLocator

class MailObserver implements PostObserver {
	
	override send(Post post) {
		val lista = post.destino
		lista.getMailsDestino(post).forEach [ mailDestino |
			var mail = new Mail
			mail.from = post.emisor.mail
			mail.titulo = "[" + lista.encabezado + "] nuevo post"
			mail.message = post.mensaje
			mail.to = mailDestino
			// messageSender se obtiene del singleton ServiceLocator
			ServiceLocator.instance.messageSender.send(mail)
		]
	}

}
