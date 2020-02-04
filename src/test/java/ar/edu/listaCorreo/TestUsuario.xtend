package ar.edu.listaCorreo

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertFalse
import static org.junit.jupiter.api.Assertions.assertTrue
import static org.junit.jupiter.api.Assertions.assertEquals

@DisplayName("Tests de usuario")
class TestUsuario {

	Miembro usuarioInicial
	Miembro usuarioBloqueado

	@BeforeEach
	def void init() {
		usuarioInicial = new Miembro("inicial@algo2.com")
		usuarioBloqueado = new Miembro("user@algo2.com") => [
			bloqueado = true
		]
	}

	@Test
	@DisplayName("un miembro por defecto está desbloqueado")
	def void miembroEstaPorDefectoDesbloqueado() {
		assertFalse(usuarioInicial.bloqueado)	
	}

	@Test
	@DisplayName("un miembro por defecto no envió ningún mail")
	def void miembroPorDefectoNoEnvioNingunMail() {
		assertEquals(0, usuarioInicial.envioMail)	
	}

	@Test
	@DisplayName("un miembro inicialmente no manda muchos mensajes")
	def void miembroInicialmenteNoMandaMuchosMensajes() {
		assertFalse(usuarioInicial.envioMuchosMensajes)	
	}

	@Test
	@DisplayName("un miembro envía muchos post y pasa a enviar muchos mensajes para el sistema - valor límite")
	def void miembroMandaMuchosMensajes() {
		(1..Miembro.TOPE_ENVIO_MAILS).forEach [ usuarioInicial.envioMail ]
		assertTrue(usuarioInicial.envioMuchosMensajes)	
	}
	
	@Test
	@DisplayName("un miembro bloqueado se puede desbloquear")
	def void bloquearYDesbloquearMiembro() {
		assertTrue(usuarioBloqueado.bloqueado)
		usuarioBloqueado.desbloquear()
		assertFalse(usuarioBloqueado.bloqueado)
	}
	
}