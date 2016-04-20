package ar.edu.listaCorreo.suscripcion

import ar.edu.listaCorreo.suscripcion.TipoSuscripcion
import ar.edu.listaCorreo.Miembro
import ar.edu.listaCorreo.ListaCorreo

class SuscripcionAbierta implements TipoSuscripcion {
	
	override suscribir(Miembro miembro, ListaCorreo lista) {
		lista.agregarMiembro(miembro)
	}
	
	override aprobarSuscripcion(Miembro miembro, ListaCorreo lista) {
		throw new UnsupportedOperationException("No se deben aprobar suscripciones de listas de suscripción abierta")
	}
	
}