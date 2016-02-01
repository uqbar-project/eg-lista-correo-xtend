package ar.edu.listaCorreoDecorada.listas

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class ModoSuscripcion {
	ListaCorreoImpl lista
	
	def abstract void suscribir(Miembro miembro)
}