package ar.edu.listaCorreo.exceptions

/**
 * Representa una excepción del negocio
 */
class BusinessException extends RuntimeException {
	
	new(String message) {
		super(message)
	}
	
}