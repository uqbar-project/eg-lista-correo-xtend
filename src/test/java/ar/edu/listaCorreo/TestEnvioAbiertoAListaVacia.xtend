package ar.edu.listaCorreo

import ar.edu.listaCorreo.observers.Mail
import ar.edu.listaCorreo.observers.MailObserver
import ar.edu.listaCorreo.observers.MessageSender
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.mockito.ArgumentMatchers.*
import static org.mockito.Mockito.*

@DisplayName("Dada una lista de envío abierto a una lista vacía")
class TestEnvioAbiertoAListaVacia {

	ListaCorreo listaVacia
	Miembro dodain
	Post mensajeAListaVacia
	MessageSender mockedMailSender

	@BeforeEach
	def void init() {
		mockedMailSender = mock(MessageSender)

		/** Listas de correo */
		listaVacia = ListaCorreo.listaEnvioAbierto() => [
			agregarPostObserver(new MailObserver(mockedMailSender))
		]

		/** Miembros */
		dodain = new Miembro("fernando.dodino@gmail.com")

		/** en la de alumnos hay alumnos y profes */
		mensajeAListaVacia = new Post(dodain, "Sale la nueva de Sillicon Valley!")
	}

	/*************************************************************/
	/*                     TESTS CON STUBS                       */
	/*                      TEST DE ESTADO                       */
	/*************************************************************/

	@Test
	@DisplayName("Al enviarse un post no le llega el mensaje a nadie")
	def void testListaVaciaNoLeLlegaNingunPostANadie() {
		listaVacia.recibirPost(mensajeAListaVacia)
		verify(mockedMailSender, never).send(any(Mail))
	}

}
