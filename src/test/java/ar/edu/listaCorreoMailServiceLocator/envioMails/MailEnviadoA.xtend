package ar.edu.listaCorreoMailServiceLocator.envioMails

import ar.edu.listaCorreoMailServiceLocator.observers.Mail
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
