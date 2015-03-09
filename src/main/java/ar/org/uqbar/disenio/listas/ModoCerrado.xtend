package ar.org.uqbar.disenio.listas

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ModoCerrado extends ModoSuscripcion {
	
	List<Miembro> miembrosPendientes = new ArrayList<Miembro>()

	override suscribir(Miembro miembro) {
		miembrosPendientes.add(miembro)
	}
	
	def aprobar(Miembro miembro) {
		miembrosPendientes.remove(miembro)
		this.lista.agregarMiembro(miembro)
	}
	
	def rechazar(Miembro miembro) {
		miembrosPendientes.remove(miembro)
	}
	
}