package ar.edu.listaCorreoMailServiceLocator.observers

import ar.edu.listaCorreoMailServiceLocator.ListaCorreo
import ar.edu.listaCorreoMailServiceLocator.Post

class BloqueoUsuarioVerbosoObserver implements PostObserver {
	
	override send(Post post, ListaCorreo lista) {
		val emisor = post.emisor
		if (emisor.envioMuchosMensajes) {
			emisor.bloquear			
		}
	}
	
}