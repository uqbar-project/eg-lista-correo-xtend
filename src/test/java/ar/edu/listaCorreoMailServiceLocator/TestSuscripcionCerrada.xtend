package ar.edu.listaCorreoMailServiceLocator

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertFalse
import static org.junit.jupiter.api.Assertions.assertTrue

@DisplayName("Dada una lista de suscripción cerrada")
class TestSuscripcionCerrada {

	ListaCorreo listaCerrada
	Miembro dodain
	Miembro nico
	Miembro deby

	@BeforeEach
	def void init() {
		listaCerrada = ListaCorreo.listaSuscripcionCerrada()
		
		/** Usuarios **/
		dodain = new Miembro("fernando.dodino@gmail.com")
		nico = new Miembro("nicolas.passerini@gmail.com")
		deby = new Miembro("debyfortini@gmail.com")
		
		listaCerrada.agregarMiembro(dodain)
		listaCerrada.agregarMiembro(nico)
	}
		
	@Test
	@DisplayName("cuando un miembro se suscribe debe esperar el ok de un administrador para estar en la lista")
	def void suscripcionAListaCerradaNoEsAutomatica() {
		assertFalse(listaCerrada.estaSuscripto(deby))
		listaCerrada.suscribir(deby)
		assertFalse(listaCerrada.estaSuscripto(deby))		
	}

	@Test
	@DisplayName("cuando un miembro se suscribe y el administrador lo aprueba, pasa a formar parte de la lista")
	def void suscripcionYAprobacionDeListaCerrada() {
		assertFalse(listaCerrada.estaSuscripto(deby))
		listaCerrada.suscribir(deby)
		listaCerrada.aprobarSuscripcion(deby)		
		assertTrue(listaCerrada.estaSuscripto(deby))
	}

}
