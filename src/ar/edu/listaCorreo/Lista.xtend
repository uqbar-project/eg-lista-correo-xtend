package ar.edu.listaCorreo

import java.util.List
import java.util.ArrayList
import ar.edu.listaCorreo.observers.MessageSender

class Lista {
	@Property List<Miembro> miembros
	@Property TipoEnvio tipoEnvio
	@Property List<MessageSender> messageSenders
	
	def static Lista listaAbierta() {
		new Lista
	}	

	def static Lista listaCerrada() {
		var lista = new Lista
		lista.tipoEnvio = new ListaRestringida
		lista
	}	
	
	/** Constructor, por default toda lista es abierta */
	new() {
		miembros = new ArrayList<Miembro>
		tipoEnvio = new ListaAbierta
		messageSenders = new ArrayList<MessageSender>
	}
	
	def void agregarMiembro(Miembro miembro) {
		miembros.add(miembro)
	}
	
	def void agregarSender(MessageSender sender) {
		messageSenders.add(sender)
	}
	
	def void enviar(Mensaje mensaje) {
		tipoEnvio.validar(mensaje, this)
		messageSenders.forEach [ sender | sender.send(mensaje) ]
	}
	
	def String getDestinatarios() {
		miembros.map [ miembro | miembro.mail ].toString
	}
	
	def boolean estaSuscripto(Miembro miembro) {
		miembros.contains(miembro)	
	}
	
}