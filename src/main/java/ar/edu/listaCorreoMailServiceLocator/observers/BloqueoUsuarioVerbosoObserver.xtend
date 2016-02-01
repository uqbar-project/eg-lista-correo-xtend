package ar.edu.listaCorreoMailServiceLocator.observers

import ar.edu.listaCorreoMailServiceLocator.Post

class BloqueoUsuarioVerbosoObserver implements PostObserver {
	
	override send(Post post) {
		val emisor = post.emisor
		if (emisor.envioMuchosMensajes) {
			emisor.bloquear			
		}
	}
	
}