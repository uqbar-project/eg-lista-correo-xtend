package ar.edu.listaCorreoMailSingleton.observers

import ar.edu.listaCorreoMailSingleton.Post

class MailObserver implements PostObserver {
	// No usamos la variable messageSender

	override send(Post post) {
		val lista = post.destino
		lista.getMailsDestino(post).forEach [ mailDestino |
			var mail = new Mail
			mail.from = post.emisor.mail
			mail.titulo = "[" + lista.encabezado + "] nuevo post"
			mail.message = post.mensaje
			mail.to = mailDestino
			// messageSender se reemplaza por la instancia concreta singleton
			StubMailSender.instance.send(mail)
		]
	}

}
