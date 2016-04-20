package ar.edu.listaCorreoDecorada.listas

import ar.edu.listaCorreoDecorada.emails.EmailSender

class EmailSenderProvider {
	public static EmailSender emailSender

	static def void setEmailSender(EmailSender aEmailSender) {
		emailSender = aEmailSender
	}
}
