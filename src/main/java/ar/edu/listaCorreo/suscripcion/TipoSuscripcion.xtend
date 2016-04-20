package ar.edu.listaCorreo.suscripcion

import ar.edu.listaCorreo.Miembro
import ar.edu.listaCorreo.ListaCorreo

interface TipoSuscripcion {

	 def void suscribir(Miembro miembro, ListaCorreo lista)
	 def void aprobarSuscripcion(Miembro miembro, ListaCorreo lista)
	 
}