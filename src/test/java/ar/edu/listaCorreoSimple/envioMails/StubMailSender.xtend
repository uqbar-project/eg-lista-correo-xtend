package ar.edu.listaCorreoSimple.envioMails

import ar.edu.listaCorreoMailSingleton.observers.Mail
import ar.edu.listaCorreoMailSingleton.observers.MessageSender
import java.util.HashMap
import java.util.HashSet
import java.util.Map
import java.util.Set

class StubMailSender implements MessageSender {
	Map<String, Set<String>> mailsEnviados
	
	private new() {
		mailsEnviados = new HashMap<String, Set<String>>
	}
	
	static StubMailSender instance
	
	static def getInstance() {
		if (instance == null) {
			instance = new StubMailSender
		}
		instance
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