package ar.edu.listaCorreoMailServiceLocator.suscripcion

import ar.edu.listaCorreoMailServiceLocator.Miembro
import ar.edu.listaCorreoMailServiceLocator.ListaCorreo

interface TipoSuscripcion {
	
	 def void suscribir(Miembro miembro, ListaCorreo lista)
	 def void aprobarSuscripcion(Miembro miembro, ListaCorreo lista)
	 
}