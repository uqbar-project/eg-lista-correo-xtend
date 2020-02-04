package ar.edu.listaCorreo

import ar.edu.listaCorreo.envioMails.StubMailSender
import ar.edu.listaCorreo.exceptions.BusinessException
import ar.edu.listaCorreo.observers.MailObserver
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

		listaEnvioRestringido => [
			agregarMiembro(dodain)
			agregarMiembro(nico)
			agregarMiembro(deby)
			agregarPostObserver(new MailObserver(stubMailSender))
		]

		mensajeAlumnoRecursividad = new Post(alumno, "Hola, queria preguntar que es la recursividad")
	}

	/*************************************************************/
	/*                     TESTS CON STUBS                       */
	/*                      TEST DE ESTADO                       */
	/*************************************************************/
	@Test
	@DisplayName("Un miembro que no está suscripto a una lista de envío restringido no puede enviar post")
	def void miembroNoSuscriptoNoPuedeEnviarPostAListaDeEnvioRestringido() {
		assertThrows(BusinessException, [ listaEnvioRestringido.recibirPost(mensajeAlumnoRecursividad) ])
	}

}
