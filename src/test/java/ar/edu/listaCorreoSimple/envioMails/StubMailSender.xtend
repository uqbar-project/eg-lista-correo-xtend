package ar.edu.listaCorreoSimple.envioMails

import ar.edu.listaCorreoSimple.envioMails.Mail
import ar.edu.listaCorreoSimple.envioMails.MailSender
import java.util.HashMap
import java.util.HashSet
import java.util.Map
import java.util.Set

class StubMailSender implements MailSender {
	Map<String, Set<String>> mailsEnviados
	
	new() {
		mailsEnviados = new HashMap<String, Set<String>>
	}
	
	override send(Mail mail) {
		simularEnvioMail(mail.from, mail.message)
	}
	
	def simularEnvioMail(String from, String message) {
		val mensajes = mailsDe(from)
		mensajes.add(message)
		mailsEnviados.put(from, mensajes)
	}
	
	def Set<String> mailsDe(String from) {
		mailsEnviados.get(from) ?: new HashSet<String> 
	}
	
}