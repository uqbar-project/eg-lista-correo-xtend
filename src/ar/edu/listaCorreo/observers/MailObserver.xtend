package ar.edu.listaCorreo.observers

import ar.edu.listaCorreo.observers.PostObserver
import ar.edu.listaCorreo.Post

class MailObserver implements PostObserver {
	MessageSender messageSender
	
	new(MessageSender pMessageSender) {
		messageSender = pMessageSender
	}
	
	override send(Post post) {
		val lista = post.destino
		var mail = new Mail
		mail.from = post.emisor.mail
		// Es fácil cambiar para que envíe los mails de a uno
		mail.to = lista.getMailsDestino(post)
		//
		mail.titulo = "[" + lista.encabezado + "] nuevo post"
		mail.message = post.mensaje
		messageSender.send(mail)
	}
	
}