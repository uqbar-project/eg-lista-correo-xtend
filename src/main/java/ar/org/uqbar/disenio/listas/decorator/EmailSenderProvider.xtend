package ar.org.uqbar.disenio.listas.decorator

import ar.org.uqbar.disenio.emails.decorator.EmailSender

class EmailSenderProvider {
	public static var EmailSender emailSender

	static def void setEmailSender(EmailSender aEmailSender) {
		emailSender = aEmailSender
	}
}
