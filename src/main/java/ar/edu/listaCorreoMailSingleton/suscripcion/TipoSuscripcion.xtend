package ar.edu.listaCorreoMailSingleton.suscripcion

import ar.edu.listaCorreoMailSingleton.Miembro
import ar.edu.listaCorreoMailSingleton.Lista

interface TipoSuscripcion {
	
	 def void suscribir(Miembro miembro, Lista lista)
	 def void aprobarSuscripcion(Miembro miembro, Lista lista)
	 
}