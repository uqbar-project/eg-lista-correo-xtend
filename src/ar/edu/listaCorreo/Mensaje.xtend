package ar.edu.listaCorreo

class Mensaje {
	
	@Property Miembro emisor
	@Property Lista destino
	@Property String mensaje
	
	new(Miembro pEmisor, String pMensaje, Lista pDestino) {
		emisor = pEmisor
		mensaje = pMensaje
		destino = pDestino
	}

	def String from() {
		emisor.mail
	}
	
}