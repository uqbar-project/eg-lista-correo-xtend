package ar.edu.listaCorreoSimple.envioMails

import org.mockito.ArgumentMatcher
import org.mockito.invocation.InvocationOnMock
import org.mockito.stubbing.Answer

class ImprimirPorConsola implements Answer<Void> {

	override answer(InvocationOnMock invocation) throws Throwable {
		val arguments = invocation.arguments
		val mail = arguments.get(0) as Mail
		println("=====> Simulación envío de mail by MOCKITO")
		println("   From: " + mail.from + " | To: " + mail.to + " | Message: " + mail.message)
		println("********************************************************")
		return null
	}

}

class MailEnviadoA implements ArgumentMatcher<Mail> {

	String mailDestino

	new(String mailDestino) {
		this.mailDestino = mailDestino
	}

	override matches(Mail mail) {
		mail.to.equalsIgnoreCase(mailDestino)
	}

}