package ar.edu.listaCorreoMailSingleton.suscripcion

import ar.edu.listaCorreoMailSingleton.Miembro
import java.util.ArrayList
import java.util.List
import ar.edu.listaCorreoMailSingleton.Lista

class SuscripcionCerrada implements TipoSuscripcion {
	List<Miembro> miembrosPendientes = new ArrayList<Miembro>

	override suscribir(Miembro miembro, Lista lista) {
		this.agregarMiembrosPendientes(miembro)
	}

	override aprobarSuscripcion(Miembro miembro, Lista lista) {
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