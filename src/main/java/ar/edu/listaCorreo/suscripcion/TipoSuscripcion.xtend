package ar.edu.listaCorreo.suscripcion

import ar.edu.listaCorreo.Miembro
import ar.edu.listaCorreo.Lista

interface TipoSuscripcion {
	
	 def void suscribir(Miembro miembro, Lista lista)
	 def void aprobarSuscripcion(Miembro miembro, Lista lista)
	 
}