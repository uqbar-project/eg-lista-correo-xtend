package ar.org.uqbar.disenio.listas.decorator

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class ModoSuscripcion {
	ListaCorreoImpl lista
	
	def abstract void suscribir(Miembro miembro)
}