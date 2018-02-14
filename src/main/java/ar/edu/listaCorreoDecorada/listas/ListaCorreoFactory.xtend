package ar.edu.listaCorreoDecorada.listas

class ListaCorreoFactory {

	def ListaCorreo abiertaYLibre() {
		return new ListaCorreoImpl
	}

	def ListaCerrada cerradaYLibre() {
		return new ListaCerrada
	}


	def ListaCorreo abiertaYRestringida() {
		return new ListaCorreoRestringida(new ListaCorreoImpl)
	}

	def ListaCorreo cerradaYRestringida() {
		return new ListaCorreoRestringida(new ListaCerrada)
	}

}
