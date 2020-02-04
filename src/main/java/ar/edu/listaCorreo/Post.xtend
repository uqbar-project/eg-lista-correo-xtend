package ar.edu.listaCorreo

import java.util.List
import org.eclipse.xtend.lib.annotations.Data

/**
 * El Post es un Value Object, por eso se representa como un @Data
 */
@Data
class Post {

	Miembro emisor
	String mensaje

	def tiene(String palabra) {
		palabrasDelMensaje.contains(palabra)
	}

	def List<String> palabrasDelMensaje() {
		mensaje.split(" ")
	}
	
	def enviarMail() {
		emisor.envioMail
	}

}
