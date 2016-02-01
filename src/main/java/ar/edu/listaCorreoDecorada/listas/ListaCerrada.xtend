package ar.edu.listaCorreoDecorada.listas

import java.util.List

interface ListaCerrada extends ListaCorreo {
	
	def List<Miembro> getMiembrosPendientes()
	def void aprobar(Miembro miembro)
	def void rechazar(Miembro miembro)
	
}