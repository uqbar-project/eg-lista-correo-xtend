package ar.edu.listaCorreoEnvioBloques.listas

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertFalse
import static org.junit.jupiter.api.Assertions.assertTrue

@DisplayName("Dada una lista de suscripción cerrada")
class ListaCerradaTestCase extends ListaTestCase {

	@BeforeEach
	override void setUp() {
		super.setUp()
		lista = new ListaCorreoBuilder().cerrada().libre().build()
		
	}
	
	@Test
	@DisplayName("cuando un usuario se suscribe, debe esperar el ok del administrador")
	def testSuscripcion() {
		lista.suscribir(leo)
		assertFalse(lista.miembros.contains(leo), "Se esperaba que leo no este en la lista")
		assertFalse(lista.miembros.contains(leo), "Se esperaba que pablo no este en la lista")
		val modo = lista.modoSuscripcion as ModoCerrado 
		assertTrue(modo.miembrosPendientes.contains(leo), "Se esperaba que " + leo + "este pendiente")
	}
	
	@Test
	@DisplayName("cuando un usuario se suscribe y el administrador lo aprueba, el miembro se incorpora a la lista")
	def testAprobar() {
		lista.suscribir(leo)
		val modo = lista.modoSuscripcion as ModoCerrado
		modo.aprobar(leo)
		assertTrue(lista.miembros.contains(leo), "Se esperaba que leo este en la lista")
		assertFalse(modo.miembrosPendientes.contains(leo), "Se esperaba que " + leo + " no este pendiente")	
	}
	
	@Test
	@DisplayName("cuando un usuario se suscribe y el administrador lo rechaza, el miembro queda fuera de la lista")
	def testRechazar() {
		lista.suscribir(leo)
		val modo = lista.modoSuscripcion as ModoCerrado
		modo.rechazar(leo)
		assertFalse(lista.miembros.contains(leo), "Se esperaba que leo no este en la lista")
		assertFalse(modo.miembrosPendientes.contains(leo), "Se esperaba que " + leo + " no este pendiente")
	}

}