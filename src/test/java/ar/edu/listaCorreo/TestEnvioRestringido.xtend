package ar.edu.listaCorreo

import ar.edu.listaCorreoSimple.ListaCorreo
import ar.edu.listaCorreoSimple.Miembro
import ar.edu.listaCorreoSimple.Post
import ar.edu.listaCorreoSimple.exceptions.BusinessException
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
		listaEnvioRestringido = ListaCorreo.listaEnvioRestringido()

		/** Miembros */
		dodain = new Miembro("fernando.dodino@gmail.com")
		nico = new Miembro("nicolas.passerini@gmail.com")
		deby = new Miembro("debyfortini@gmail.com")
		alumno = new Miembro("alumno@uni.edu.ar")

		listaEnvioRestringido => [
			agregarMiembro(dodain)
			agregarMiembro(nico)
			agregarMiembro(deby)
		]

		mensajeAlumnoRecursividad = new Post(alumno, "Hola, queria preguntar que es la recursividad")
	}

	/*************************************************************/
	/*                     TESTS CON STUBS                       */
	/*                      TEST DE ESTADO                       */
	/*************************************************************/

	@Test
	@DisplayName("Un miembro que no está suscripto no puede enviar un post")
	def void miembroNoSuscriptoNoPuedeEnviarPostAListaDeEnvioRestringido() {
		assertThrows(BusinessException, [ listaEnvioRestringido.recibirPost(mensajeAlumnoRecursividad) ])
	}

}
