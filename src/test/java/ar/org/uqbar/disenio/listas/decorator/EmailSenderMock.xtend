package ar.org.uqbar.disenio.listas.decorator

import ar.org.uqbar.disenio.emails.decorator.Email
import ar.org.uqbar.disenio.emails.decorator.EmailSender
import java.util.ArrayList
import org.junit.Assert

class EmailSenderMock implements EmailSender {

	var emailsEnviados = new ArrayList<Email>()

	override send(Email email) {
		this.emailsEnviados.add(email)
	}

	def void assertEmailEnviado(String message, int cantidad, Post post) {
		var correspondientes = emailsEnviados.filter(
			[Email email|email.from == post.from && email.subject == post.subject && email.content == post.content])
		Assert.assertEquals(message, cantidad, correspondientes.size())
	}
}
