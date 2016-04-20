package ar.edu.listaCorreoMailServiceLocator.suscripcion

import ar.edu.listaCorreoMailServiceLocator.suscripcion.TipoSuscripcion
import ar.edu.listaCorreoMailServiceLocator.Miembro
import ar.edu.listaCorreoMailServiceLocator.ListaCorreo

class SuscripcionAbierta implements TipoSuscripcion {
	
	override suscribir(Miembro miembro, ListaCorreo lista) {
		lista.agregarMiembro(miembro)
	}
	
	override aprobarSuscripcion(Miembro miembro, ListaCorreo lista) {
		throw new UnsupportedOperationException("No se deben aprobar suscripciones de listas de suscripción abierta")
	}
	
}