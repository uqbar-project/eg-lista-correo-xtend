package ar.edu.listaCorreoMailSingleton

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Miembro {
	
	public static int TOPE_ENVIO_MAILS = 5

	String mail
	int mailsEnviados = 0
	boolean bloqueado = false
	
	new(String _mail) {
		mail = _mail
	}
	
	def boolean envioMuchosMensajes() {
		mailsEnviados >= TOPE_ENVIO_MAILS
	}
	
	def void envioMail() {
		mailsEnviados++	
	}
	
	def void bloquear() {
		bloqueado = true
	}

	def void desbloquear() {
		bloqueado = false
	}
	
}
