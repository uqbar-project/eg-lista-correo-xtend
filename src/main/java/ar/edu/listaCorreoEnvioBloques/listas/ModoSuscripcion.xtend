package ar.edu.listaCorreoEnvioBloques.listas

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class ModoSuscripcion {
	ListaCorreo lista
	
	def abstract void suscribir(Miembro miembro)
}