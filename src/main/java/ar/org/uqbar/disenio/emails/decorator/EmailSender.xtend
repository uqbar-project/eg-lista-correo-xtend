package ar.org.uqbar.disenio.emails.decorator

interface EmailSender {
	def void send(Email email)
}