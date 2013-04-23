package ar.edu.listaCorreo.observers

import ar.edu.listaCorreo.observers.MessageSender
import java.util.List
import java.util.ArrayList
import ar.edu.listaCorreo.Mensaje

class MalasPalabrasObserver implements MessageSender {
	
	List<String> malasPalabras = new ArrayList<String>
	List<Mensaje> mensajesConMalasPalabras = new ArrayList<Mensaje>
	
	override send(Mensaje mensaje) {
		if (tieneMalasPalabras(mensaje.mensaje)) {
			println ("Mensaje enviado a admin")
			mensajesConMalasPalabras.add(mensaje)
		}
	}
	
	def boolean tieneMalasPalabras(String message) {
		malasPalabras.exists [ mala | palabras(message).contains(mala) ]
	}
	
	def void agregarMalaPalabra(String palabra) {
		malasPalabras.add(palabra)
	}
	
	def List<String> palabras(String message) {
		message.split(" ")
	}
	
	def mensajesConMalasPalabras() {
		mensajesConMalasPalabras
	}
	
}