package ar.org.uqbar.disenio.listas.decorator

class ListaCorreoRestringida implements ListaCorreo {

	private ListaCorreoImpl listaDecorada

	new(ListaCorreoImpl listaDecorada) {
		this.listaDecorada = listaDecorada
	}

	override def void suscribir(Miembro miembro) {
		this.listaDecorada.suscribir(miembro)
	}

	override def agregarMiembro(Miembro miembro) {
		this.listaDecorada.agregarMiembro(miembro)
	}

	override def remitentePertenece(Post post) {
		return this.listaDecorada.remitentePertenece(post)
	}

	override getMiembros() {
		return this.listaDecorada.getMiembros()
	}
	//Este es el metodo que realmente decoro
	override def void enviar(Post post) {
		if (!this.remitentePertenece(post)) {
			throw new RuntimeException("El post" + post + "no es de un miembro de la lista " + this)
		}
		this.listaDecorada.enviar(post)
	}


}
