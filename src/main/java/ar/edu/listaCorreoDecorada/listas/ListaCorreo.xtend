package ar.edu.listaCorreoDecorada.listas

import java.util.List

interface ListaCorreo {
	
	def List<Miembro> getMiembros()
	
	def void suscribir(Miembro miembro)
	
	def void agregarMiembro(Miembro miembro)
	
	def boolean remitentePertenece(Post post)
	
	def void enviar(Post post)
	
}