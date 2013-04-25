package ar.org.uqbar.disenio.listas.decorator

class ListaCorreroFactory {


	def ListaCorreo abiertaYLibre() {
		return  new ListaCorreoImpl();
	}

	def ListaCerrada cerradaYLibre() {
		return new ListaCerradaImpl();
	}


	def ListaCorreo abiertaYRestringida() {
		return new ListaCorreoRestringida(new ListaCorreoImpl());
	}

	def ListaCerrada cerradaYRestringida() {
		return new ListaCerradaRestringida(new ListaCerradaImpl());
	}

}
