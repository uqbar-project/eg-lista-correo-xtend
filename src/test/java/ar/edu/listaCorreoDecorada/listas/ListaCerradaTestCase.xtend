package ar.edu.listaCorreoDecorada.listas

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertFalse
import static org.junit.jupiter.api.Assertions.assertTrue

@DisplayName("Dada una lista de suscripción cerrada")
class ListaCerradaTestCase extends ListaTestCase<ListaCerrada> {
	
	@BeforeEach
	override void setUp() {
		super.setUp()
		lista = new ListaCorreoFactory().cerradaYLibre()
		
	}
	
	@Test
	@DisplayName("Un miembro que envía una suscripción debe esperar que un administrador lo apruebe")
	def testSuscripcion() {
		lista.suscribir(leo)
		assertFalse(lista.miembros.contains(leo), "Se esperaba que leo no este en la lista")
		assertFalse(lista.miembros.contains(leo), "Se esperaba que pablo no este en la lista")
		assertTrue(lista.miembrosPendientes.contains(leo), "Se esperaba que " + leo + "este pendiente")
	}
	
	@Test
	@DisplayName("Cuando un administrador aprueba la suscripción incorpora el miembro a la lista")
	def testAprobar() {
		lista.suscribir(leo)
		lista.aprobar(leo)
		assertTrue(lista.miembros.contains(leo), "Se esperaba que leo este en la lista")
		assertFalse(lista.miembrosPendientes.contains(leo), "Se esperaba que " + leo+ " no este pendiente")	
	}
	
	@Test
	@DisplayName("Un miembro cuya suscripción se rechaza no puede estar en la lista")
	def testRechazar() {
		lista.suscribir(leo)
		lista.rechazar(leo)
		assertFalse(lista.miembros.contains(leo), "Se esperaba que leo no este en la lista")
		assertFalse(lista.miembrosPendientes.contains(leo), "Se esperaba que " + leo + " no este pendiente")
	}
	
}