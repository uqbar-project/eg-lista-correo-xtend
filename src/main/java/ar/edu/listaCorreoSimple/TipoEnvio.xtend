package ar.edu.listaCorreoSimple

import ar.edu.listaCorreoSimple.exceptions.BusinessException

interface TipoEnvio {
	
	def void validarEnvio(Post post, Lista lista)
	
}

class EnvioRestringido implements TipoEnvio {

	override void validarEnvio(Post post, Lista lista) {
		if (!lista.estaSuscripto(post.emisor)) {
			throw new BusinessException("El usuario no está suscripto")
		}
	}
		
}

class EnvioAbierto implements TipoEnvio {
	
	override validarEnvio(Post post, Lista lista) {
	}
	
}
