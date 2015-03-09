package ar.org.uqbar.disenio.listas.decorator

class ListaCorreoFactory {

	def ListaCorreo abiertaYLibre() {
		return new ListaCorreoImpl
	}

	def ListaCerrada cerradaYLibre() {
		return new ListaCerradaImpl
	}


	def ListaCorreo abiertaYRestringida() {
		return new ListaCorreoRestringida(new ListaCorreoImpl)
	}

	def ListaCorreo cerradaYRestringida() {
		return new ListaCorreoRestringida(new ListaCerradaImpl)
	}

}
