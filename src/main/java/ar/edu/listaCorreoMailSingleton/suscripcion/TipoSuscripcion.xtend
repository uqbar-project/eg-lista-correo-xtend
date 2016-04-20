package ar.edu.listaCorreoMailSingleton.suscripcion

import ar.edu.listaCorreoMailSingleton.Miembro
import ar.edu.listaCorreoMailSingleton.ListaCorreo

interface TipoSuscripcion {
	
	 def void suscribir(Miembro miembro, ListaCorreo lista)
	 def void aprobarSuscripcion(Miembro miembro, ListaCorreo lista)
	 
}