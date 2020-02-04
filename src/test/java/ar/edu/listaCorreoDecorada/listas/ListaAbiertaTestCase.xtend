package ar.edu.listaCorreoDecorada.listas

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertFalse
import static org.junit.jupiter.api.Assertions.assertTrue

@DisplayName("Dada una lista de suscripción abierta")
class ListaAbiertaTestCase extends ListaTestCase<ListaCorreo> {
	
	@BeforeEach 
	override void setUp() {
		super.setUp()
		lista = new ListaCorreoFactory().abiertaYLibre
	}
	
	@Test
	@DisplayName("Una lista de suscripción abierta suscribe automáticamente a un miembro")
	def testSuscripcion() {
		lista.suscribir(leo)
		assertTrue(lista.miembros.contains(leo), "Se esperaba que leo este en la lista")
		assertFalse(lista.miembros.contains(pablo), "Se esperaba que pablo no este en la lista")
	}
	
	
}