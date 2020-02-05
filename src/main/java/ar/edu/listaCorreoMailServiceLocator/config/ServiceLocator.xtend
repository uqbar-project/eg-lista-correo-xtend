package ar.edu.listaCorreoMailServiceLocator.config

import ar.edu.listaCorreoMailServiceLocator.observers.MessageSender
import org.eclipse.xtend.lib.annotations.Accessors

class ServiceLocator {

	@Accessors MessageSender messageSender
	
	/**********************************************
	 * IMPLEMENTACION DE SINGLETON
	 * ********************************************/
	static ServiceLocator instance

	// redefinimos el new como privado
	private new() {
	}

	def static getInstance() {
		if (instance === null) {
			instance = new ServiceLocator
		}	
		instance
	}
	
}