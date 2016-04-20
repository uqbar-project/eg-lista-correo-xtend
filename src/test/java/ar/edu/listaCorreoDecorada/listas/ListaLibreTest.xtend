package ar.edu.listaCorreoDecorada.listas

import org.junit.Before
import org.junit.Test

class ListaLibreTest extends ListaTestCase<ListaCorreo>{
	
	@Before 
	override def void setUp() {
		super.setUp()
		lista = new ListaCorreoFactory().abiertaYLibre()
		lista => [
			suscribir(leo)
			suscribir(nico)
			suscribir(pablo)
		]	
	}
	
	@Test
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