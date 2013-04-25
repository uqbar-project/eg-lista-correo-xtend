package ar.org.uqbar.disenio.listas

class ListaCorreroBuilder {

	private ListaCorreo lista = new ListaCorreo();

	def ListaCorreroBuilder abierta() {
		return this.modoSucripcion(new ModoAbierto());
	}

	def ListaCorreroBuilder cerrada() {
		return this.modoSucripcion(new ModoCerrado());
	}

	def ListaCorreroBuilder modoSucripcion(ModoSuscripcion modo) {
		modo.lista = lista;
		lista.modoSuscripcion = modo;
		return this;
	}

	def ListaCorreroBuilder restringida() {
		lista.validator = [Post post, ListaCorreo lista |
			if (!lista.remitentePertenece(post)) {
				throw new RuntimeException("El post" + post + "no es de un miembro de la lista " + lista)
			}];
		return this;
	}

	def ListaCorreroBuilder libre() {
		lista.validator = [Post post, ListaCorreo lista|];
		return this;
	}

	def ListaCorreo build() {
		return lista;
	}

}
