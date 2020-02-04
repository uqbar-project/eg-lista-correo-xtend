package ar.edu.listaCorreo.envioMails

import ar.edu.listaCorreo.observers.Mail
import org.mockito.ArgumentMatcher

class MailEnviadoA implements ArgumentMatcher<Mail> {
	
	String mailDestino
	
	new(String mailDestino) {
		this.mailDestino = mailDestino
	}
	
	override matches(Mail mail) {
		mail.to.equalsIgnoreCase(mailDestino)
	}
	
}
