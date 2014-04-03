package ar.org.uqbar.disenio.listas.decorator

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class ListaCerradaTestCase extends ListaTestCase<ListaCerrada> {
	
	@Before 
	override def void setUp() {
		super.setUp()
		lista = new ListaCorreoFactory().cerradaYLibre()
		
	}
	
	@Test
	def testSuscripcion() {
		lista.suscribir(leo)
		Assert.assertFalse("Se esperaba que leo no este en la lista", lista.miembros.contains(leo))
		Assert.assertFalse("Se esperaba que pablo no este en la lista", lista.miembros.contains(leo))
		Assert.assertTrue("Se esperaba que " + leo+ "este pendiente", lista.miembrosPendientes.contains(leo))
	}
	
	@Test
	def testAprobar() {
		lista.suscribir(leo)
		lista.aprobar(leo)
		Assert.assertTrue("Se esperaba que leo este en la lista", lista.miembros.contains(leo))
		Assert.assertFalse("Se esperaba que " + leo+ " no este pendiente", lista.miembrosPendientes.contains(leo))	
	}
	
	@Test
	def testRechazar() {
		lista.suscribir(leo)
		lista.rechazar(leo)
		Assert.assertFalse("Se esperaba que leo no este en la lista", lista.miembros.contains(leo))
		Assert.assertFalse("Se esperaba que " + leo+ " no este pendiente", lista.miembrosPendientes.contains(leo))
	}
	
}