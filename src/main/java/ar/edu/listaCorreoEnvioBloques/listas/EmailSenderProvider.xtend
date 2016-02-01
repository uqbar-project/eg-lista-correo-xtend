package ar.edu.listaCorreoEnvioBloques.listas

import ar.edu.listaCorreoEnvioBloques.emails.EmailSender

class EmailSenderProvider {
	public static var EmailSender emailSender

	static def void setEmailSender(EmailSender aEmailSender) {
		emailSender = aEmailSender
	}
}
