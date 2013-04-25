package ar.edu.listaCorreo.suscripcion

import ar.edu.listaCorreo.Miembro
import ar.edu.listaCorreo.Lista

abstract class TipoSuscripcion {
	/** 
	 * ACLARACION
	 * **********
	 * 
	 * No se puede generar una interfaz TipoSuscripcion para esta versión de xtend
	 * dado que tiene una referencia circular con Lista
	 */
	 def void suscribir(Miembro miembro, Lista lista)
	 def void aprobarSuscripcion(Miembro miembro, Lista lista)
}