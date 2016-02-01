package ar.edu.listaCorreoDecorada.emails

interface EmailSender {
	def void send(Email email)
}