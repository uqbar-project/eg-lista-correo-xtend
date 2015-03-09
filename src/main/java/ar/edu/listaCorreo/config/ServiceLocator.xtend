package ar.edu.listaCorreo.config

import ar.edu.listaCorreo.observers.MessageSender
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ServiceLocator {

	MessageSender messageSender
	
	/**********************************************
	 * IMPLEMENTACION DE SINGLETON
	 * ********************************************/
	static ServiceLocator instance

	// redefinimos el new como privado
	private new() {
	}

	def static getInstance() {
		if (instance == null) {
			instance = new ServiceLocator
		}	
		instance
	}
	
}