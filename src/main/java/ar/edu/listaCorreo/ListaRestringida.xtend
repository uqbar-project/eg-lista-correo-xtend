package ar.edu.listaCorreo

import ar.edu.listaCorreo.exceptions.BusinessException

class ListaRestringida extends TipoEnvio {

	override void validarEnvio(Post post, ListaCorreo lista) {
		if (!lista.estaSuscripto(post.emisor)) {
			throw new BusinessException("El usuario no está suscripto")
		}
	}
		
}