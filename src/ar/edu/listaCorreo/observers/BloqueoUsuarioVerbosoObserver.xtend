package ar.edu.listaCorreo.observers

import ar.edu.listaCorreo.Post

class BloqueoUsuarioVerbosoObserver implements PostObserver {
	
	override send(Post post) {
		val emisor = post.emisor
		if (emisor.envioMuchosMensajes) {
			emisor.bloquear			
		}
	}
	
}