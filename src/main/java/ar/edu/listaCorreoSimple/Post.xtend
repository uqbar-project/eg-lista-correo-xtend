package ar.edu.listaCorreoSimple

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Post {

	Miembro emisor
	Lista destino
	String mensaje

	new(Miembro pEmisor, String pMensaje, Lista pDestino) {
		emisor = pEmisor
		mensaje = pMensaje
		destino = pDestino
	}

	def tiene(String palabra) {
		palabrasDelMensaje.contains(palabra)
	}

	def List<String> palabrasDelMensaje() {
		mensaje.split(" ")
	}

}
