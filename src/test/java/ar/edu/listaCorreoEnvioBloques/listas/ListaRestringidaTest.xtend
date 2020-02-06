package ar.edu.listaCorreoEnvioBloques.listas

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test
import static org.junit.jupiter.api.Assertions.assertThrows

@DisplayName("Dada una lista de envío restringido")
class ListaRestringidaTest extends ListaTestCase {
	
	@BeforeEach
	override void setUp() {
		super.setUp()
		lista = new ListaCorreoBuilder().abierta().restringida().build()
		lista => [
			suscribir(leo)
			suscribir(nico)
			suscribir(pablo)
		]
	}

	@Test
	@DisplayName("un miembro que pertenece a la lista puede enviar mails")
	def testEnviarMiembro() {
		val post = new Post => [
			content = "Hola"
			from = leo.mailDefault
			subject = "Yeah"
		]
		lista.enviar(post)
		emailSenderMock.assertEmailEnviado("Se esperaba que se envien 2 mails", 2, post)
	}

	@Test
	@DisplayName("un miembro que no pertenece a la lista no puede enviar mails")
	def void testEnviarNoMiembro() {
		val post = new Post => [
			content = "Hola"
			from = "fulano@gmail.com"
			subject = "Yeah"
		]
		assertThrows(RuntimeException, [ lista.enviar(post) ])
	}

}
