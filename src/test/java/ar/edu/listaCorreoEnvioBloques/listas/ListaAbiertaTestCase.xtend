package ar.edu.listaCorreoEnvioBloques.listas

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test
import static org.junit.jupiter.api.Assertions.assertTrue
import static org.junit.jupiter.api.Assertions.assertFalse

@DisplayName("Dada una lista de suscripción abierta")
class ListaAbiertaTestCase extends ListaTestCase {
	
	@BeforeEach 
	override void setUp() {
		super.setUp()
		lista = new ListaCorreoBuilder().abierta().libre().build()
	}
	
	@Test
	@DisplayName("un usuario que se suscribe automáticamente pasa a estar en la lista")
	def testSuscripcion() {
		lista.suscribir(leo)
		assertTrue(lista.miembros.contains(leo), "Se esperaba que leo este en la lista")
		assertFalse(lista.miembros.contains(pablo), "Se esperaba que pablo no este en la lista")
	}

}