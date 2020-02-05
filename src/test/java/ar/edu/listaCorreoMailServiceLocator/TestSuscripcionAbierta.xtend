package ar.edu.listaCorreoMailServiceLocator

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertFalse
import static org.junit.jupiter.api.Assertions.assertThrows
import static org.junit.jupiter.api.Assertions.assertTrue

@DisplayName("Dada una lista de suscripción abierta")
class TestSuscripcionAbierta {

	ListaCorreo listaAbierta
	Miembro dodain
	Miembro deby
	Miembro fede

	@BeforeEach
	def void init() {
		listaAbierta = ListaCorreo.listaSuscripcionAbierta()
		
		/** Usuarios **/
		dodain = new Miembro("fernando.dodino@gmail.com")
		deby = new Miembro("debyfortini@gmail.com")
		fede = new Miembro("fede@uni.edu.ar")
		
		listaAbierta.agregarMiembro(dodain)
		listaAbierta.agregarMiembro(fede)
	}
		
	@Test
	@DisplayName("la suscripción es automática y pasa a integrar la lista")
	def void suscripcionAListaAbiertaEsAutomatica() {
		assertFalse(listaAbierta.estaSuscripto(deby))
		listaAbierta.suscribir(deby)
		assertTrue(listaAbierta.estaSuscripto(deby))		
	}

	@Test
	@DisplayName("tratar de aprobar la suscripción no tiene sentido, es un error")
	def void aprobarSuscripcionDeListaAbiertaNoTieneSentido() {
		assertThrows(UnsupportedOperationException, [ listaAbierta.aprobarSuscripcion(deby) ])
	}

}
