package ar.edu.listaCorreo

import ar.edu.listaCorreo.envioMails.MailEnviadoA
import ar.edu.listaCorreo.observers.Mail
import ar.edu.listaCorreo.observers.MailObserver
import ar.edu.listaCorreo.observers.MessageSender
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.mockito.ArgumentMatchers.*
import static org.mockito.Mockito.*

@DisplayName("Dada una lista de envío abierto con miembros - utilizando Mocks")
class TestEnvioAbiertoMock {

	ListaCorreo listaEnvioAbiertoMock
	Miembro dodain
	Miembro deby
	Miembro alumno
	Miembro fede
	Post mensajeAlumnoRecursividad
	Post mensajeDodainAlumnos
	MessageSender mockedMailSender

	@BeforeEach
	def void init() {
		mockedMailSender = mock(MessageSender)
		
		/** Listas de correo */
		listaEnvioAbiertoMock = ListaCorreo.listaEnvioAbierto() => [
			agregarPostObserver(new MailObserver(mockedMailSender))
		]

		/** Miembros */
		dodain = new Miembro("fernando.dodino@gmail.com")
		deby = new Miembro("debyfortini@gmail.com")
		alumno = new Miembro("alumno@uni.edu.ar")
		fede = new Miembro("fede@uni.edu.ar")

		/** en la de alumnos hay alumnos y profes */
		listaEnvioAbiertoMock => [
			agregarMiembro(dodain)
			agregarMiembro(deby)
			agregarMiembro(fede)
		]

		mensajeAlumnoRecursividad = new Post(alumno, "Hola, queria preguntar que es la recursividad")
		mensajeDodainAlumnos = new Post(dodain,
			"Para explicarte recursividad tendría que explicarte qué es la recursividad")
	}

	/*************************************************************/
	/*                     TESTS CON MOCKS                       */
	/*                  TEST DE COMPORTAMIENTO                   */
	/*************************************************************/
	@Test
	@DisplayName("Al enviar un post le llega el mensaje a todos los demás suscriptos")
	def void testEnvioPostAListaAlumnosLlegaATodosLosOtrosSuscriptos() {
		listaEnvioAbiertoMock.recibirPost(mensajeDodainAlumnos)

		//verificacion
		//test de comportamiento, verifico que se enviaron 2 mails 
		// a fede y a deby, no así a dodi que fue el que envió el post
		verify(mockedMailSender, times(2)).send(any(Mail))
	}

	@Test
	@DisplayName("Al enviar un post no le llega el mensaje a quien lo envió")
	def void testAlQueEnviaPostNoLeLlegaMail() {
		listaEnvioAbiertoMock.recibirPost(mensajeDodainAlumnos)

		// busco que nunca hayan enviado un mail al emisor del post: fdodino
		verify(mockedMailSender, never).send(argThat(new MailEnviadoA(dodain.mail)))
	}

	@Test
	@DisplayName("Al enviarse un post a alguno le llega un mail")
	def void enviarMailAListaAlumnos() {
		listaEnvioAbiertoMock.recibirPost(mensajeAlumnoRecursividad)

		verify(mockedMailSender, atLeastOnce).send(any(Mail))
	}	

}
