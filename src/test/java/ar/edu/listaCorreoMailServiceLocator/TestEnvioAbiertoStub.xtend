package ar.edu.listaCorreoMailServiceLocator

import ar.edu.listaCorreoMailServiceLocator.config.ServiceLocator
import ar.edu.listaCorreoMailServiceLocator.envioMails.MailException
import ar.edu.listaCorreoMailServiceLocator.envioMails.StubMailSender
import ar.edu.listaCorreoMailServiceLocator.observers.Mail
import ar.edu.listaCorreoMailServiceLocator.observers.MailObserver
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.fail
import static org.mockito.Mockito.*

@DisplayName("Dada una lista de envío abierto con miembros - utilizando Stubs")
class TestEnvioAbiertoStub {

	ListaCorreo listaEnvioAbiertoStub
	Miembro dodain
	Miembro deby
	Miembro alumno
	Miembro fede
	Post mensajeAlumnoRecursividad
	Post mensajeAlumnoOrdenSuperior
	StubMailSender stubMailSender

	@BeforeEach
	def void init() {
		stubMailSender = new StubMailSender
		
		/** ************************************************/
		/** Configuramos ServiceLocator para tener el stub */	
		ServiceLocator.instance.messageSender = stubMailSender
		/** ************************************************/
		
		/** Listas de correo */
		listaEnvioAbiertoStub = ListaCorreo.listaEnvioAbierto() => [
			agregarPostObserver(new MailObserver)
		]

		/** Miembros */
		dodain = new Miembro("fernando.dodino@gmail.com")
		deby = new Miembro("debyfortini@gmail.com")
		alumno = new Miembro("alumno@uni.edu.ar")
		fede = new Miembro("fede@uni.edu.ar")

		/** en la de alumnos hay alumnos y profes */
		listaEnvioAbiertoStub => [
			agregarMiembro(dodain)
			agregarMiembro(deby)
			agregarMiembro(fede)
		]

		mensajeAlumnoRecursividad = new Post(alumno, "Hola, queria preguntar que es la recursividad")
		mensajeAlumnoOrdenSuperior = new Post(alumno, "Orden superior tiene que ver con religion? Gracias!")
	}

	/*************************************************************/
	/*                     TESTS CON STUBS                       */
	/*                      TEST DE ESTADO                       */
	/*************************************************************/

	@Test
	@DisplayName("Un miembro que no está suscripto puede enviar un post")
	def void miembroNoSuscriptoPuedeEnviarMailAListaAbierta() {
		assertEquals(0, stubMailSender.mailsDe("alumno@uni.edu.ar").size)
		listaEnvioAbiertoStub.recibirPost(mensajeAlumnoRecursividad)
		assertEquals(1, stubMailSender.mailsDe("alumno@uni.edu.ar").size)
	}

	@Test
	@DisplayName("Cada post que se recibe envía a su vez un mail que es registrado en el sistema")
	def void alumnoEnvia2MailsYSeRegistranAmbosMailsEnElStub() {
		assertEquals(0, stubMailSender.mailsDe("alumno@uni.edu.ar").size)
		listaEnvioAbiertoStub.recibirPost(mensajeAlumnoRecursividad)
		listaEnvioAbiertoStub.recibirPost(mensajeAlumnoOrdenSuperior)
		assertEquals(2, stubMailSender.mailsDe("alumno@uni.edu.ar").size)
	}

	@Test
	@DisplayName("Al enviar dos mensajes y fallar el segundo, solo se envía un mail")
	def void alumnoQuiereEnviarDosMailsPeroElSegundoFallaYSoloSeEnviaUno() {
		assertEquals(0, stubMailSender.mailsDe("alumno@uni.edu.ar").size)

		// Con Mockito
		// Decoramos al stub para hacer que devuelva error cuando envíe el segundo mensaje
		val stubMailSenderDecorado = spy(stubMailSender)
		// Cambiamos la referencia del ServiceLocator en forma indirecta (no cambiamos el observer)
		ServiceLocator.instance.messageSender = stubMailSenderDecorado
		
		// Acá decimos declarativamente: Que tire MailException
		// - cuando al objeto stubMailSenderDecorado
		// - reciba un mensaje send
		// - con un parametro igual al Mail que le pasamos como ejemplo
		//   (ademas tuvimos que redefinir el equals del Mail para que detecte
		//    dos mails iguales si tienen el mismo mensaje)
		doThrow(MailException).when(stubMailSenderDecorado).send(
			new Mail => [
				message = mensajeAlumnoOrdenSuperior.mensaje
			]
		)

		try {
			listaEnvioAbiertoStub => [
				recibirPost(mensajeAlumnoRecursividad)
				recibirPost(mensajeAlumnoOrdenSuperior)
			]
			fail("Deberia haber tirado error")
		} catch (MailException e) {
			// Esperamos que tire error
		}
		// Qué testeamos, que no haya un try/catch vacío en Lista
		assertEquals(1, stubMailSender.mailsDe("alumno@uni.edu.ar").size)
	}
	
}
