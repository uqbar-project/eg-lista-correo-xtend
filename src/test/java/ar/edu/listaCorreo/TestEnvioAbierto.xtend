package ar.edu.listaCorreo

import ar.edu.listaCorreo.envioMails.MailEnviadoA
import ar.edu.listaCorreo.envioMails.MailException
import ar.edu.listaCorreo.envioMails.StubMailSender
import ar.edu.listaCorreo.observers.BloqueoUsuarioVerbosoObserver
import ar.edu.listaCorreo.observers.Mail
import ar.edu.listaCorreo.observers.MailObserver
import ar.edu.listaCorreo.observers.MalasPalabrasObserver
import ar.edu.listaCorreo.observers.MessageSender
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertTrue
import static org.junit.jupiter.api.Assertions.fail
import static org.mockito.ArgumentMatchers.*
import static org.mockito.Mockito.*

@DisplayName("Dada una lista de envío abierto")
class TestEnvioAbierto {

	ListaCorreo listaEnvioAbierto
	ListaCorreo listaVacia
	Miembro dodain
	Miembro deby
	Miembro alumno
	Miembro fede
	Post mensajeAlumnoRecursividad
	Post mensajeAlumnoOrdenSuperior
	Post mensajeDodainAlumnos
	Post mensajeAListaVacia
	StubMailSender stubMailSender
	MessageSender mockedMailSender
	MalasPalabrasObserver malasPalabrasObserver

	@BeforeEach
	def void init() {
		mockedMailSender = mock(MessageSender)
		stubMailSender = new StubMailSender
		malasPalabrasObserver = new MalasPalabrasObserver
		
		/** Listas de correo */
		listaEnvioAbierto = ListaCorreo.listaEnvioAbierto()

		/** Miembros */
		dodain = new Miembro("fernando.dodino@gmail.com")
		deby = new Miembro("debyfortini@gmail.com")
		alumno = new Miembro("alumno@uni.edu.ar")
		fede = new Miembro("fede@uni.edu.ar")

		/** en la de alumnos hay alumnos y profes */
		listaEnvioAbierto => [
			agregarMiembro(dodain)
			agregarMiembro(deby)
			agregarMiembro(fede)
			agregarPostObserver(new MailObserver(stubMailSender))
			agregarPostObserver(malasPalabrasObserver)
			agregarPostObserver(new BloqueoUsuarioVerbosoObserver)
		]

		listaVacia = ListaCorreo.listaSuscripcionAbierta()
		
		mensajeAlumnoRecursividad = new Post(alumno, "Hola, queria preguntar que es la recursividad")
		mensajeDodainAlumnos = new Post(dodain,
			"Para explicarte recursividad tendría que explicarte qué es la recursividad")
		mensajeAlumnoOrdenSuperior = new Post(alumno, "Orden superior tiene que ver con religion? Gracias!")
		mensajeAListaVacia = new Post(dodain, "Sale la nueva de Sillicon Valley!")
	}

	/*************************************************************/
	/*                     TESTS CON STUBS                       */
	/*                      TEST DE ESTADO                       */
	/*************************************************************/

	@Test
	@DisplayName("Un miembro que no está suscripto a una lista de envío abierto puede enviar un post")
	def void miembroNoSuscriptoPuedeEnviarMailAListaAbierta() {
		assertEquals(0, stubMailSender.mailsDe("alumno@uni.edu.ar").size)
		listaEnvioAbierto.recibirPost(mensajeAlumnoRecursividad)
		assertEquals(1, stubMailSender.mailsDe("alumno@uni.edu.ar").size)
	}

	@Test
	@DisplayName("Al enviarse un mail con malas palabras es registrado por el sistema")
	def void alumnoEnviaMailConMalaPalabra() {
		val mensajeFeo = new Post(alumno, "Cuál es loco! Me tienen podrido")
		malasPalabrasObserver.agregarMalaPalabra("podrido")
		listaEnvioAbierto.recibirPost(mensajeFeo)
		assertEquals(1, malasPalabrasObserver.postConMalasPalabras.size)
	}

	@Test
	@DisplayName("Cada post que se recibe envía a su vez un mail que es registrado en el sistema")
	def void alumnoEnvia2MailsYSeRegistranAmbosMailsEnElStub() {
		assertEquals(0, stubMailSender.mailsDe("alumno@uni.edu.ar").size)
		listaEnvioAbierto.recibirPost(mensajeAlumnoRecursividad)
		listaEnvioAbierto.recibirPost(mensajeAlumnoOrdenSuperior)
		assertEquals(2, stubMailSender.mailsDe("alumno@uni.edu.ar").size)
	}

	@Test
	@DisplayName("Un miembro que envía muchos mensajes es bloqueado por verboso")
	def void alumnoEsBloqueadoPorEnviarMuchosMensajes() {
		(1..10).forEach [ listaEnvioAbierto.recibirPost(mensajeAlumnoRecursividad) ]
		assertTrue(alumno.envioMuchosMensajes)
		assertTrue(alumno.bloqueado)
	}

	@Test
	@DisplayName("Al enviar dos mensajes y fallar el segundo, solo se envía un mail")
	def void alumnoQuiereEnviarDosMailsPeroElSegundoFallaYSoloSeEnviaUno() {
		assertEquals(0, stubMailSender.mailsDe("alumno@uni.edu.ar").size)

		// Con Mockito
		// Decoramos al stub para hacer que devuelva error cuando envíe el segundo mensaje
		val stubMailSenderDecorado = spy(stubMailSender)
		
		// Acá decimos declarativamente: Que tire MailException
		// - cuando al objeto stubMailSenderDecorado
		// - reciba un mensaje send
		// - con un parametro igual al Mail que le pasamos como ejemplo
		//   (ademas tuvimos que redefinir el equals del Mail para que detecte
		//    dos mails iguales si tienen el mismo mensaje)
		doThrow(MailException).when(stubMailSenderDecorado).send(
			new Mail => [
				message = mensajeAlumnoOrdenSuperior.mensaje
			])

		try {
			listaEnvioAbierto => [
				eliminarPostObservers
				agregarPostObserver(new MailObserver(stubMailSenderDecorado))
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
	
	/*************************************************************/
	/*                     TESTS CON MOCKS                       */
	/*                  TEST DE COMPORTAMIENTO                   */
	/*************************************************************/
	@Test
	@DisplayName("Al enviar un post le llega el mensaje a todos los demás suscriptos menos")
	def void testEnvioPostAListaAlumnosLlegaATodosLosOtrosSuscriptos() {
		listaEnvioAbierto.agregarPostObserver(new MailObserver(mockedMailSender))

		// un alumno envía un mensaje a la lista
		listaEnvioAbierto.recibirPost(mensajeDodainAlumnos)

		//verificacion
		//test de comportamiento, verifico que se enviaron 2 mails 
		// a fede y a deby, no así a dodi que fue el que envió el post
		verify(mockedMailSender, times(2)).send(any(Mail))
	}

	@Test
	@DisplayName("Al enviar un post no llega el mensaje a quien lo envió")
	def void testAlQueEnviaPostNoLeLlegaMail() {
		listaEnvioAbierto => [
			agregarPostObserver(new MailObserver(mockedMailSender))
			recibirPost(mensajeDodainAlumnos)
		]
		// busco que nunca hayan enviado un mail al emisor del post: fdodino
		verify(mockedMailSender, never).send(argThat(new MailEnviadoA(dodain.mail)))
	}

	@Test
	@DisplayName("Al enviarse un post a una lista no vacía a alguno le llega un mail")
	def void enviarMailAListaAlumnos() {
		listaEnvioAbierto => [
			agregarPostObserver(new MailObserver(mockedMailSender))
			recibirPost(mensajeAlumnoRecursividad)
		]
		verify(mockedMailSender, atLeastOnce).send(any(Mail))
	}	

	@Test
	@DisplayName("Si una lista está vacía al enviarse un post no le llega el mensaje a nadie")
	def void testListaVaciaNoLeLlegaNingunPostANadie() {
		listaVacia => [
			agregarPostObserver(new MailObserver(mockedMailSender))
			recibirPost(mensajeAListaVacia)
		]
		verify(mockedMailSender, never).send(any(Mail))
	}

}
