package ar.edu.listaCorreoMailServiceLocator.observers

import ar.edu.listaCorreoMailServiceLocator.Post

interface PostObserver {
	
	def void send(Post post)
	
}