package ar.edu.listaCorreoEnvioBloques.listas

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class ListaCerradaTestCase extends ListaTestCase {

	@Before 
	override def void setUp() {
		super.setUp()
		lista = new ListaCorreoBuilder().cerrada().libre().build()
		
	}
	
	@Test
	def testSuscripcion() {
		lista.suscribir(leo)
		Assert.assertFalse("Se esperaba que leo no este en la lista", lista.miembros.contains(leo))
		Assert.assertFalse("Se esperaba que pablo no este en la lista", lista.miembros.contains(leo))
		var modo = lista.modoSuscripcion as ModoCerrado 
		Assert.assertTrue("Se esperaba que " + leo+ "este pendiente", modo.miembrosPendientes.contains(leo))
	}
	
	@Test
	def testAprobar() {
		lista.suscribir(leo)
		var modo = lista.modoSuscripcion as ModoCerrado
		modo.aprobar(leo)
		Assert.assertTrue("Se esperaba que leo este en la lista", lista.miembros.contains(leo))
		Assert.assertFalse("Se esperaba que " + leo+ " no este pendiente", modo.miembrosPendientes.contains(leo))	
	}
	
	@Test
	def testRechazar() {
		lista.suscribir(leo)
		var modo = lista.modoSuscripcion as ModoCerrado
		modo.rechazar(leo)
		Assert.assertFalse("Se esperaba que leo no este en la lista", lista.miembros.contains(leo))
		Assert.assertFalse("Se esperaba que " + leo+ " no este pendiente", modo.miembrosPendientes.contains(leo))
		
	}
	
	
	
}