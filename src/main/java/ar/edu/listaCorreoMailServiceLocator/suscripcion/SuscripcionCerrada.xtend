package ar.edu.listaCorreoMailServiceLocator.suscripcion

import ar.edu.listaCorreoMailServiceLocator.Miembro
import java.util.ArrayList
import java.util.List
import ar.edu.listaCorreoMailServiceLocator.ListaCorreo

class SuscripcionCerrada implements TipoSuscripcion {
	List<Miembro> miembrosPendientes = new ArrayList<Miembro>

	override suscribir(Miembro miembro, ListaCorreo lista) {
		this.agregarMiembrosPendientes(miembro)
	}

	override aprobarSuscripcion(Miembro miembro, ListaCorreo lista) {
		this.eliminarMiembrosPendientes(miembro)
		lista.agregarMiembro(miembro)
	}
		
	def agregarMiembrosPendientes(Miembro miembro) { 
		miembrosPendientes.add(miembro)
	}

	def eliminarMiembrosPendientes(Miembro miembro) { 
		miembrosPendientes.remove(miembro)
	}
	
}