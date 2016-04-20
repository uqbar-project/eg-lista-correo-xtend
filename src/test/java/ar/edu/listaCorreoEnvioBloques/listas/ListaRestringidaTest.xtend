package ar.edu.listaCorreoEnvioBloques.listas

import org.junit.Before
import org.junit.Test

class ListaRestringidaTest extends ListaTestCase {
	
	@Before
	override def void setUp() {
		super.setUp()
		lista = new ListaCorreoBuilder().abierta().restringida().build()
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

	@Test(expected=typeof(RuntimeException))
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
