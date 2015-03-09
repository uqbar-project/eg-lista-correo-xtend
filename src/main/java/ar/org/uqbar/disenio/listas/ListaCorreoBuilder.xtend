package ar.org.uqbar.disenio.listas

class ListaCorreoBuilder {

	private ListaCorreo lista = new ListaCorreo()

	def ListaCorreoBuilder abierta() {
		return this.modoSucripcion(new ModoAbierto)
	}

	def ListaCorreoBuilder cerrada() {
		return this.modoSucripcion(new ModoCerrado)
	}

	def ListaCorreoBuilder modoSucripcion(ModoSuscripcion modo) {
		modo.lista = lista
		lista.modoSuscripcion = modo
		return this
	}

	def ListaCorreoBuilder restringida() {
		lista.validator = [Post post, ListaCorreo lista |
			if (!lista.remitentePertenece(post)) {
				throw new RuntimeException("El post" + post + "no es de un miembro de la lista " + lista)
			}]
		return this
	}

	def ListaCorreoBuilder libre() {
		lista.validator = [Post post, ListaCorreo lista|]
		return this
	}

	def ListaCorreo build() {
		return lista
	}

}
