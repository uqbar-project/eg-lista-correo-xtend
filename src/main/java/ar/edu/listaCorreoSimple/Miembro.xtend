package ar.edu.listaCorreoSimple

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Miembro {
	
	String mail
	
	new(String pMail) {
		mail = pMail
	}

	override toString() {
		mail
	}

}