package ar.edu.listaCorreoMailSingleton

import ar.edu.listaCorreoMailSingleton.exceptions.BusinessException
import ar.edu.listaCorreoMailSingleton.observers.MailObserver
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

	@BeforeEach
	def void init() {
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
