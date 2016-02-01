package ar.edu.listaCorreoMailServiceLocator

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Miembro {
	
	String mail
	int mailsEnviados = 0
	boolean bloqueado = false
	
	new(String pMail) {
		mail = pMail
	}
	
	def boolean envioMuchosMensajes() {
		mailsEnviados >= 5
	}
	
	def void bloquear() {
		bloqueado = true
	}

	def void desbloquear() {
		bloqueado = false
	}
	
}