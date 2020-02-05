package ar.edu.listaCorreo

import ar.edu.listaCorreoSimple.ListaCorreo
import ar.edu.listaCorreoSimple.Miembro
import ar.edu.listaCorreoSimple.Post
import ar.edu.listaCorreoSimple.envioMails.Mail
import ar.edu.listaCorreoSimple.envioMails.MailSender
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
	MailSender mockedMailSender

	@BeforeEach
	def void init() {
		mockedMailSender = mock(MailSender)

		/** Listas de correo */
		listaVacia = ListaCorreo.listaEnvioAbierto()

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
		listaVacia => [
			mailSender = mockedMailSender
			recibirPost(mensajeAListaVacia)
		]
		verify(mockedMailSender, never).send(any(Mail), any(ListaCorreo))
	}

}
