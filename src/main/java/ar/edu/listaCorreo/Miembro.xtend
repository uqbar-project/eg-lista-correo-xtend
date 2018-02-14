package ar.edu.listaCorreo

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Miembro {
	
	String mail
	int mailsEnviados = 0
	boolean bloqueado = false
	
	new(String _mail) {
		mail = _mail
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
	
	def envioMail() {
		mailsEnviados++
	}
	
}