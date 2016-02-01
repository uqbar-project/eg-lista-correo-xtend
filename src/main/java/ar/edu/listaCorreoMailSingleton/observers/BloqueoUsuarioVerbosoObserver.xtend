package ar.edu.listaCorreoMailSingleton.observers

import ar.edu.listaCorreoMailSingleton.Post

class BloqueoUsuarioVerbosoObserver implements PostObserver {
	
	override send(Post post) {
		val emisor = post.emisor
		if (emisor.envioMuchosMensajes) {
			emisor.bloquear			
		}
	}
	
}