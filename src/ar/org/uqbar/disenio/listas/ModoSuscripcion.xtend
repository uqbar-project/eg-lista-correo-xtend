package ar.org.uqbar.disenio.listas

abstract class ModoSuscripcion {
	@Property ListaCorreo lista
	def abstract void suscribir(Miembro miembro)
}