package ar.edu.listaCorreoEnvioBloques.listas

class ListaCorreoBuilder {

	private ListaCorreo lista = new ListaCorreo()

	def ListaCorreoBuilder abierta() {
		this.modoSucripcion(new ModoAbierto)
	}

	def ListaCorreoBuilder cerrada() {
		this.modoSucripcion(new ModoCerrado)
	}

	def ListaCorreoBuilder modoSucripcion(ModoSuscripcion modo) {
		modo.lista = lista
		lista.modoSuscripcion = modo
		this
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
