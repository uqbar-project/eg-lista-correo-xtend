package ar.edu.listaCorreoEnvioBloques.listas

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class ListaAbiertaTestCase extends ListaTestCase {
	
	@Before 
	override def void setUp() {
		super.setUp()
		lista = new ListaCorreoBuilder().abierta().libre().build()
	}
	
	@Test
	def testSuscripcion() {
		lista.suscribir(leo)
		Assert.assertTrue("Se esperaba que leo este en la lista", lista.miembros.contains(leo))
		Assert.assertFalse("Se esperaba que pablo no este en la lista", lista.miembros.contains(pablo))
	}
	
	
}