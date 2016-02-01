package ar.edu.listaCorreoMailServiceLocator.suscripcion

import ar.edu.listaCorreoMailServiceLocator.Miembro
import ar.edu.listaCorreoMailServiceLocator.Lista

interface TipoSuscripcion {
	
	 def void suscribir(Miembro miembro, Lista lista)
	 def void aprobarSuscripcion(Miembro miembro, Lista lista)
	 
}