package ar.org.uqbar.disenio.listas

import ar.org.uqbar.disenio.listas.ModoSuscripcion
import java.util.ArrayList

class ModoCerrado extends ModoSuscripcion {
	
	@Property  var miembrosPendientes = new ArrayList<Miembro>();

	override suscribir(Miembro miembro) {
		miembrosPendientes.add(miembro);
	}
	
	def aprobar(Miembro miembro) {
		miembrosPendientes.remove(miembro);
		this.lista.agregarMiembro(miembro);
	}
	
	def rechazar(Miembro miembro) {
		miembrosPendientes.remove(miembro);
	}
	
}