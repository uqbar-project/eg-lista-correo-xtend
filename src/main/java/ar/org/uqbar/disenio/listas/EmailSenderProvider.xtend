package ar.org.uqbar.disenio.listas

import ar.org.uqbar.disenio.emails.EmailSender

class EmailSenderProvider {
	public static var EmailSender emailSender

	static def void setEmailSender(EmailSender aEmailSender) {
		emailSender = aEmailSender
	}
}
