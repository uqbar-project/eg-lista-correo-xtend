package ar.edu.listaCorreoMailServiceLocator.observers

import ar.edu.listaCorreoMailServiceLocator.Post
import ar.edu.listaCorreoMailServiceLocator.config.ServiceLocator

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
