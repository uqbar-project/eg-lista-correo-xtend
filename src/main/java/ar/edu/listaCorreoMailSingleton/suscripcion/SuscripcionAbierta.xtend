package ar.edu.listaCorreoMailSingleton.suscripcion

import ar.edu.listaCorreoMailSingleton.suscripcion.TipoSuscripcion
import ar.edu.listaCorreoMailSingleton.Miembro
import ar.edu.listaCorreoMailSingleton.Lista

class SuscripcionAbierta implements TipoSuscripcion {
	
	override suscribir(Miembro miembro, Lista lista) {
		lista.agregarMiembro(miembro)
	}
	
	override aprobarSuscripcion(Miembro miembro, Lista lista) {
		throw new UnsupportedOperationException("No se deben aprobar suscripciones de listas de suscripción abierta")
	}
	
}