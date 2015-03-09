package ar.org.uqbar.disenio.emails

interface EmailSender {
	def void send(Email email)
}