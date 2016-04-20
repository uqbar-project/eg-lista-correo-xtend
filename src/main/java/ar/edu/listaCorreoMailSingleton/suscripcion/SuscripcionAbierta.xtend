package ar.edu.listaCorreoMailSingleton.suscripcion

import ar.edu.listaCorreoMailSingleton.suscripcion.TipoSuscripcion
import ar.edu.listaCorreoMailSingleton.Miembro
import ar.edu.listaCorreoMailSingleton.ListaCorreo

class SuscripcionAbierta implements TipoSuscripcion {
	
	override suscribir(Miembro miembro, ListaCorreo lista) {
		lista.agregarMiembro(miembro)
	}
	
	override aprobarSuscripcion(Miembro miembro, ListaCorreo lista) {
		throw new UnsupportedOperationException("No se deben aprobar suscripciones de listas de suscripción abierta")
	}
	
}