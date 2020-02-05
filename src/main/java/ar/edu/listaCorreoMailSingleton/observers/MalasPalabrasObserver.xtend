package ar.edu.listaCorreoMailSingleton.observers

import ar.edu.listaCorreoMailSingleton.ListaCorreo
import ar.edu.listaCorreoMailSingleton.Post
import java.util.ArrayList
import java.util.List

class MalasPalabrasObserver implements PostObserver {

	List<String> malasPalabras = new ArrayList<String>
	List<Post> postConMalasPalabras = new ArrayList<Post>

	override send(Post post, ListaCorreo lista) {
		if (tieneMalasPalabras(post)) {
			println("Mensaje enviado a admin por mensaje con malas palabras: " + post.mensaje)
			postConMalasPalabras.add(post)
		}
	}

	def boolean tieneMalasPalabras(Post post) {
		malasPalabras.exists [ malaPalabra | post.tiene(malaPalabra) ]
	}

	def void agregarMalaPalabra(String palabra) {
		malasPalabras.add(palabra)
	}

	def mensajesConMalasPalabras() {
		postConMalasPalabras
	}

}
