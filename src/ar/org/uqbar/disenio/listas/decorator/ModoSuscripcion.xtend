package ar.org.uqbar.disenio.listas.decorator

abstract class ModoSuscripcion {
	@Property ListaCorreoImpl lista
	def abstract void suscribir(Miembro miembro)
}