package ar.edu.listaCorreoMailServiceLocator

import ar.edu.listaCorreoMailServiceLocator.exceptions.BusinessException

class ListaRestringida extends TipoEnvio {

	override void validarEnvio(Post post, Lista lista) {
		if (!lista.estaSuscripto(post.emisor)) {
			throw new BusinessException("El usuario no está suscripto")
		}
	}
		
}