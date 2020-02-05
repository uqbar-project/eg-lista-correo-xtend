package ar.edu.listaCorreoSimple

import ar.edu.listaCorreoSimple.envioMails.Mail
import ar.edu.listaCorreoSimple.envioMails.MailSender
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ListaCorreo {

	List<Miembro> miembros = newArrayList
	TipoEnvio tipoEnvio = new EnvioAbierto
	String encabezado
	MailSender mailSender

	/**
	 * CONSTRUCTORES
	 
	 */
	/** Constructor default: toda lista es abierta */
	def static ListaCorreo listaEnvioAbierto() {
		new ListaCorreo
	}

	def static ListaCorreo listaEnvioRestringido() {
		new ListaCorreo => [
			tipoEnvio = new EnvioRestringido
		]
	}

	/** 
	 * CASO DE USO: Recibir un post
	 *  
	 **/
	def void recibirPost(Post post) {
		tipoEnvio.validarEnvio(post, this)
		val mailsDestino = this.getMailsDestino(post)
		mailsDestino.forEach [ mailDestino |
			val mail = new Mail => [
				from = post.emisor.mail
				titulo = "[" + this.encabezado + "] nuevo post"
				message = post.mensaje
				to = mailDestino
			]
			mailSender.send(mail)
		]

	}

	def getDestinatarios(Post post) {
		miembros.filter[miembro|!miembro.equals(post.emisor)].toList
	}

	def getMailsDestino(Post post) {
		getDestinatarios(post).map[miembro|miembro.mail]
	}

	def estaSuscripto(Miembro miembro) {
		miembros.contains(miembro)
	}

	def void agregarMiembro(Miembro miembro) {
		miembros.add(miembro)
	}
	
}
