package ar.edu.listaCorreoMailServiceLocator.observers

import ar.edu.listaCorreoMailServiceLocator.ListaCorreo
import ar.edu.listaCorreoMailServiceLocator.Post
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
