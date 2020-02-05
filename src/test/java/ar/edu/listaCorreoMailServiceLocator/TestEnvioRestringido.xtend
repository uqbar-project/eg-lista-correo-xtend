package ar.edu.listaCorreoMailServiceLocator

import ar.edu.listaCorreoMailServiceLocator.config.ServiceLocator
import ar.edu.listaCorreoMailServiceLocator.envioMails.StubMailSender
import ar.edu.listaCorreoMailServiceLocator.exceptions.BusinessException
import ar.edu.listaCorreoMailServiceLocator.observers.MailObserver
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertThrows

@DisplayName("Dada una lista de envío restringido")
class TestEnvioRestringido {

	ListaCorreo listaEnvioRestringido
	Miembro dodain
	Miembro nico
	Miembro deby
	Miembro alumno
	Post mensajeAlumnoRecursividad
	StubMailSender stubMailSender

	@BeforeEach
	def void init() {
		stubMailSender = new StubMailSender
		
		/** Listas de correo */
		listaEnvioRestringido = ListaCorreo.listaSuscripcionCerrada()

		/** Miembros */
		dodain = new Miembro("fernando.dodino@gmail.com")
		nico = new Miembro("nicolas.passerini@gmail.com")
		deby = new Miembro("debyfortini@gmail.com")
		alumno = new Miembro("alumno@uni.edu.ar")

		/** ************************************************/
		/** Configuramos ServiceLocator para tener el stub */	
		ServiceLocator.instance.messageSender = stubMailSender
		/** ************************************************/
				
		listaEnvioRestringido => [
			agregarMiembro(dodain)
			agregarMiembro(nico)
			agregarMiembro(deby)
			agregarPostObserver(new MailObserver)
		]

		mensajeAlumnoRecursividad = new Post(alumno, "Hola, queria preguntar que es la recursividad")
	}

	/*************************************************************/
	/*                     TESTS CON STUBS                       */
	/*                      TEST DE ESTADO                       */
	/*************************************************************/
	@Test
	@DisplayName("Un miembro que no está suscripto no puede enviar post")
	def void miembroNoSuscriptoNoPuedeEnviarPostAListaDeEnvioRestringido() {
		assertThrows(BusinessException, [ listaEnvioRestringido.recibirPost(mensajeAlumnoRecursividad) ])
	}

}
