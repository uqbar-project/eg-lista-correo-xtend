package ar.edu.listaCorreoEnvioBloques.listas

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

@DisplayName("Dada una lista de envío libre")
class ListaLibreTest extends ListaTestCase {
	
	@BeforeEach
	override void setUp() {
		super.setUp()
		lista = new ListaCorreoBuilder().abierta().libre().build()	
		lista.suscribir(leo)
		lista.suscribir(nico)
		lista.suscribir(pablo)
	}
	
	@Test
	@DisplayName("un miembro que pertenece a la lista puede enviar mails correctamente")
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
	@DisplayName("un miembro que no pertenece a la lista puede enviar mails correctamente")
	def testEnviarNoMiembro() {
		val post = new Post => [
			content = "Hola"
			from = "fulano@gmail.com"
			subject = "Yeah"
		]
		lista.enviar(post)
		emailSenderMock.assertEmailEnviado("Se esperaba que se envien 3 mails", 3, post)	
	}

}