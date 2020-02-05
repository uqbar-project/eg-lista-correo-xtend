package ar.edu.listaCorreoMailServiceLocator

import java.util.List
import org.eclipse.xtend.lib.annotations.Data

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
	
	def enviar() {
		emisor.envioMail
	}

}
