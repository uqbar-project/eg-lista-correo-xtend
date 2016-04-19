package ar.edu.listaCorreoMailSingleton.observers

import ar.edu.listaCorreoMailSingleton.Post

class MailObserver implements PostObserver {
	// No usamos la variable messageSender

	override send(Post post) {
		val lista = post.destino
		lista.getMailsDestino(post).forEach [ mailDestino |
			val mail = new Mail => [
				from = post.emisor.mail
				titulo = "[" + lista.encabezado + "] nuevo post"
				message = post.mensaje
				to = mailDestino
			]
			// messageSender se reemplaza por la instancia concreta singleton
			StubMailSender.instance.send(mail)
		]
	}

}
