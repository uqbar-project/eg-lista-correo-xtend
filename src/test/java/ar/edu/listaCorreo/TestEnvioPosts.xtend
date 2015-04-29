package ar.edu.listaCorreo

import ar.edu.listaCorreo.exceptions.BusinessException
import ar.edu.listaCorreo.observers.Mail
import ar.edu.listaCorreo.observers.MailObserver
import ar.edu.listaCorreo.observers.MalasPalabrasObserver
import ar.edu.listaCorreo.observers.MessageSender
import ar.edu.listaCorreo.observers.StubMailSender
import org.junit.Assert
import org.junit.Before
import org.junit.Test

import static org.mockito.Matchers.*
import static org.mockito.Mockito.*
import org.mockito.ArgumentMatcher

class TestEnvioPosts {

	Lista listaProfes
	Lista listaAlumnos
	Lista listaVacia
	Miembro dodain
	Miembro nico
	Miembro deby
	Miembro alumno
	Miembro fede
	Post mensajeAlumno
	Post mensajeDodainAlumnos
	Post mensajeAListaVacia
	Post mensajeDodainProfes
	StubMailSender stubMailSender = new StubMailSender
	MessageSender mockedMailSender
	MalasPalabrasObserver malasPalabrasObserver = new MalasPalabrasObserver

	@Before
	def void init() {
		mockedMailSender = mock(typeof(MessageSender))
		
		/** Listas de correo */
		listaAlumnos = Lista.listaAbierta()
		listaProfes = Lista.listaCerrada()

		/** Profes */
		dodain = new Miembro("fernando.dodino@gmail.com")
		nico = new Miembro("nicolas.passerini@gmail.com")
		deby = new Miembro("debyfortini@gmail.com")

		/** Alumnos **/
		alumno = new Miembro("alumno@uni.edu.ar")
		fede = new Miembro("fede@uni.edu.ar")

		/** en la lista de profes están los profes */
		listaProfes.agregarMiembro(dodain)
		listaProfes.agregarMiembro(nico)
		listaProfes.agregarMiembro(deby)
		listaProfes.agregarPostObserver(new MailObserver(stubMailSender))

		/** en la de alumnos hay alumnos y profes */
		listaAlumnos.agregarMiembro(dodain)
		listaAlumnos.agregarMiembro(deby)
		listaAlumnos.agregarMiembro(fede)
		listaAlumnos.agregarPostObserver(new MailObserver(stubMailSender))
		listaAlumnos.agregarPostObserver(malasPalabrasObserver)

		listaVacia = Lista.listaAbierta()
		
		mensajeAlumno = new Post(alumno, "Hola, queria preguntar que es la recursividad", listaProfes)
		mensajeDodainAlumnos = new Post(dodain,
			"Para explicarte recursividad tendría que explicarte qué es la recursividad", listaAlumnos)
		mensajeDodainProfes = new Post(dodain, "Cuantos TPs hacemos?", listaProfes)
		mensajeAListaVacia = new Post(dodain, "Sale la nueva de Sillicon Valley!", listaVacia)
	}

	/*************************************************************/
	/*                     TESTS CON STUBS                       */
	/*                      TEST DE ESTADO                       */
	/*************************************************************/
	@Test(expected=typeof(BusinessException))
	def void alumnoNoPuedeEnviarPostAListaProfes() {
		listaProfes.enviar(mensajeAlumno)
	}

	@Test
	def void alumnoPuedeEnviarMailAListaAbierta() {
		Assert.assertEquals(0, stubMailSender.mailsDe("alumno@uni.edu.ar").size)
		listaAlumnos.enviar(mensajeAlumno)
		Assert.assertEquals(1, stubMailSender.mailsDe("alumno@uni.edu.ar").size)
	}

	@Test
	def void alumnoEnviaMailConMalaPalabra() {
		val mensajeFeo = new Post(alumno, "Cuál es loco! Me tienen podrido", listaAlumnos)
		malasPalabrasObserver.agregarMalaPalabra("podrido")
		listaAlumnos.enviar(mensajeFeo)
		Assert.assertEquals(1, malasPalabrasObserver.mensajesConMalasPalabras.size)
	}

	/*************************************************************/
	/*                     TESTS CON MOCKS                       */
	/*                  TEST DE COMPORTAMIENTO                   */
	/*************************************************************/
	@Test
	def void testEnvioPostAListaAlumnosLlegaATodosLosOtrosSuscriptos() {
		listaAlumnos.agregarPostObserver(new MailObserver(mockedMailSender))

		// un alumno envía un mensaje a la lista
		listaAlumnos.enviar(mensajeDodainAlumnos)

		//verificacion
		//test de comportamiento, verifico que se enviaron 2 mails 
		// a fede y a deby, no así a dodi que fue el que envió el post
		verify(mockedMailSender, times(2)).send(any(typeof(Mail)))
	}

	@Test
	def void testAlQueEnviaPostNoLeLlegaMail() {
		listaAlumnos => [
			agregarPostObserver(new MailObserver(mockedMailSender))
			enviar(mensajeDodainAlumnos)
		]
		// busco que nunca hayan enviado un mail al emisor del post: fdodino
		verify(mockedMailSender, never).send(argThat(new MailEnviadoA(dodain.mail)))
	}

	@Test
	def void testListaVaciaNoLeLlegaNingunPostANadie() {
		listaVacia => [
			agregarPostObserver(new MailObserver(mockedMailSender))
			enviar(mensajeAListaVacia)
		]
		verify(mockedMailSender, never).send(any(Mail))
	}

	@Test
	def void enviarMailAListaAlumnos() {
		listaAlumnos => [
			agregarPostObserver(new MailObserver(mockedMailSender))
			enviar(mensajeAlumno)
		]
		verify(mockedMailSender, atLeastOnce).send(any(Mail))
	}	
}

class MailEnviadoA extends ArgumentMatcher<Mail> {
	
	String mailDestino
	
	new(String mailDestino) {
		this.mailDestino = mailDestino
	}
	
	override matches(Object argument) {
		(argument as Mail).to.equalsIgnoreCase(mailDestino)
	}
	
}
