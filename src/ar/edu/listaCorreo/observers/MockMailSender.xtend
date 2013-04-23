package ar.edu.listaCorreo.observers

import ar.edu.listaCorreo.observers.MessageSender
import java.util.Map
import java.util.HashMap
import java.util.List
import java.util.ArrayList

class MockMailSender implements MessageSender {
	Map<String, List<String>> mailsEnviados
	
	new() {
		mailsEnviados = new HashMap<String, List<String>>
	}
	
	override send(Mail mail) {
		simularEnvioMail(mail.from, mail.message)
		println("Simulación envío de mail | From: " + mail.from + " | To: " + mail.to + " | Message: " + mail.message)
	}
	
	def simularEnvioMail(String from, String message) {
		var mensajes = mailsDe(from)
		mensajes.add(message)
		mailsEnviados.put(from, mensajes)
	}
	
	def List<String> mailsDe(String from) {
		var List<String> mensajes = mailsEnviados.get(from)
		if (mensajes == null) {
			mensajes = new ArrayList<String>
		}
		mensajes
	}
	
}