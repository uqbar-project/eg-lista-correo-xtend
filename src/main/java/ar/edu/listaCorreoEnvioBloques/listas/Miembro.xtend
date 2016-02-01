package ar.edu.listaCorreoEnvioBloques.listas

import ar.edu.listaCorreoEnvioBloques.emails.Email
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Miembro {
	String mailDefault
	List<String> otrosMails = new ArrayList()

	def boolean esRemitente(Post post) {
		return mailDefault == post.from || otrosMails.contains(post.from)
	}

	def enviar(Post post) {
		EmailSenderProvider.emailSender.send(
			new Email() => [
				from = post.from
				to = this.mailDefault
				content = post.content
				subject = post.subject
			])
	}
}
