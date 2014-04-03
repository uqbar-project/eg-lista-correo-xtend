package ar.org.uqbar.disenio.listas

import java.util.List
import ar.org.uqbar.disenio.emails.Email
import java.util.ArrayList

class Miembro {
	@Property String mailDefault
	@Property List<String> otrosMails = new ArrayList()

	def boolean esRemitente(Post post) {
		return mailDefault == post.from || otrosMails.contains(post.from)
	}

	def enviar(Post post) {
		EmailSenderProvider::emailSender.send(
			new Email() => [
				from = post.from
				to = this.mailDefault
				content = post.content
				subject = post.subject
			])
	}
}
