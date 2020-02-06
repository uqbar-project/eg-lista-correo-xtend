package ar.edu.listaCorreoEnvioBloques.listas

import ar.edu.listaCorreoEnvioBloques.emails.Email
import ar.edu.listaCorreoEnvioBloques.emails.EmailSender
import java.util.ArrayList

import static org.junit.jupiter.api.Assertions.assertEquals

class EmailSenderMock implements EmailSender {

	var emailsEnviados = new ArrayList<Email>()

	override send(Email email) {
		this.emailsEnviados.add(email)
	}

	def void assertEmailEnviado(String message, int cantidad, Post post) {
		val correspondientes = emailsEnviados.filter(
			[Email email|email.from.equals(post.from) && email.subject.equals(post.subject) && email.content.equals(post.content)])
		assertEquals(cantidad, correspondientes.size, message)
	}
}
