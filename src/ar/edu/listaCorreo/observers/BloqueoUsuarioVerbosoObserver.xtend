package ar.edu.listaCorreo.observers

import ar.edu.listaCorreo.observers.MessageSender
import ar.edu.listaCorreo.Mensaje

class BloqueoUsuarioVerbosoObserver implements MessageSender {
	
	override send(Mensaje mensaje) {
		val emisor = mensaje.emisor
		if (emisor.envioMuchosMensajes) {
			emisor.bloquear			
		}
	}
	
}