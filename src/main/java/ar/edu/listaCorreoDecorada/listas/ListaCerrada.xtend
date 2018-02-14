package ar.edu.listaCorreoDecorada.listas

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ListaCerrada extends ListaCorreoImpl {
	
	List<Miembro> miembrosPendientes = new ArrayList<Miembro>()

	override suscribir(Miembro miembro) {
		miembrosPendientes.add(miembro)
	}
	
	def aprobar(Miembro miembro) {
		miembrosPendientes.remove(miembro)
		this.agregarMiembro(miembro)
	}
	
	def rechazar(Miembro miembro) {
		miembrosPendientes.remove(miembro)
	}
	
}