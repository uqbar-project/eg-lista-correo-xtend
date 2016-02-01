package ar.edu.listaCorreoMailSingleton.observers

import ar.edu.listaCorreoMailSingleton.Post

interface PostObserver {
	
	def void send(Post post)
	
}