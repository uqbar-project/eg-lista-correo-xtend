package ar.edu.listaCorreo

import ar.edu.listaCorreo.exceptions.BusinessException

class ListaRestringida extends TipoEnvio {

	override void validar(Mensaje mensaje, Lista lista) {
		if (!lista.estaSuscripto(mensaje.emisor)) {
			throw new BusinessException("El usuario no está suscripto")
		}
	}
		
}