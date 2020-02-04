package ar.edu.listaCorreoDecorada.listas

class ListaCorreoRestringida implements ListaCorreo {

	ListaCorreo listaDecorada

	new(ListaCorreoImpl listaDecorada) {
		this.listaDecorada = listaDecorada
	}

	override void suscribir(Miembro miembro) {
		this.listaDecorada.suscribir(miembro)
	}

	override agregarMiembro(Miembro miembro) {
		this.listaDecorada.agregarMiembro(miembro)
	}

	override remitentePertenece(Post post) {
		return this.listaDecorada.remitentePertenece(post)
	}

	override getMiembros() {
		return this.listaDecorada.getMiembros()
	}

	//Este es el metodo que realmente decoro
	override void enviar(Post post) {
		if (!this.remitentePertenece(post)) {
			throw new RuntimeException("El post" + post + "no es de un miembro de la lista " + this)
		}
		this.listaDecorada.enviar(post)
	}

}
