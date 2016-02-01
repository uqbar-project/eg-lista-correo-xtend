package ar.edu.listaCorreoDecorada.listas

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ListaCerradaImpl extends ListaCorreoImpl implements ListaCerrada {
	
	var List<Miembro> miembrosPendientes = new ArrayList<Miembro>()

	override suscribir(Miembro miembro) {
		miembrosPendientes.add(miembro)
	}
	
	override aprobar(Miembro miembro) {
		miembrosPendientes.remove(miembro)
		this.agregarMiembro(miembro)
	}
	
	override rechazar(Miembro miembro) {
		miembrosPendientes.remove(miembro)
	}
	
}