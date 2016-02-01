package ar.edu.listaCorreoEnvioBloques.emails

interface EmailSender {
	def void send(Email email)
}