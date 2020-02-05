package ar.edu.listaCorreoSimple.envioMails

import ar.edu.listaCorreoSimple.ListaCorreo

interface MailSender {
	
	def void send(Mail mail, ListaCorreo lista)
	
}