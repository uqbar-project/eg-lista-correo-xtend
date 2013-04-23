package ar.edu.listaCorreo.observers

import java.util.List
import java.util.ArrayList
import ar.edu.listaCorreo.Post

class MalasPalabrasObserver implements PostObserver {
	
	List<String> malasPalabras = new ArrayList<String>
	List<Post> postConMalasPalabras = new ArrayList<Post>
	
	override send(Post post) {
		if (tieneMalasPalabras(post.mensaje)) {
			println ("Mensaje enviado a admin por mensaje con malas palabras: " + post.mensaje)
			postConMalasPalabras.add(post)
		}
	}
	
	def boolean tieneMalasPalabras(String message) {
		malasPalabras.exists [ mala | palabras(message).contains(mala) ]
	}
	
	def void agregarMalaPalabra(String palabra) {
		malasPalabras.add(palabra)
	}
	
	def List<String> palabras(String message) {
		message.split(" ")
	}
	
	def mensajesConMalasPalabras() {
		postConMalasPalabras
	}
	
}