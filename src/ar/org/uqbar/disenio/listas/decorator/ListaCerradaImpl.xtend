package ar.org.uqbar.disenio.listas.decorator

import java.util.ArrayList

class ListaCerradaImpl extends ListaCorreoImpl implements ListaCerrada {
	
	@Property  var miembrosPendientes = new ArrayList<Miembro>();

	override suscribir(Miembro miembro) {
		miembrosPendientes.add(miembro);
	}
	
	override aprobar(Miembro miembro) {
		miembrosPendientes.remove(miembro);
		this.agregarMiembro(miembro);
	}
	
	override rechazar(Miembro miembro) {
		miembrosPendientes.remove(miembro);
	}
	
}