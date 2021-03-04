package ar.edu.listaCorreoMailServiceLocator

import ar.edu.listaCorreoMailServiceLocator.Miembro
import ar.edu.listaCorreoMailServiceLocator.Post
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertFalse
import static org.junit.jupiter.api.Assertions.assertTrue
import static org.mockito.Mockito.*

@DisplayName("Tests de post")
class TestPost {

	Post post

	@BeforeEach
	def void init() {
		post = new Post(mock(Miembro), "A mamá Roma le aviva el amor a papá y a papá Roma le aviva el amor a mamá.")
	}

	@Test
	@DisplayName("Palabra que está en el mensaje")
	def void palabraQueEstaEnElMensaje() {
		assertTrue(post.tiene("amor"))	
	}

	@Test
	@DisplayName("Palabra que no está en el mensaje - case sensitive")
	def void palabraQueNoEstaEnElMensaje() {
		assertFalse(post.tiene("roma"))	
	}
	
	@Test
	@DisplayName("Al enviarse un post eso afecta al emisor")
	def void alEnviarseUnPostEsoAfectaAlUsuario() {
		post.enviar
		verify(post.emisor, times(1)).envioMail	
	}

	@Test
	@DisplayName("Palabras del mensaje")
	def void miembroInicialmenteNoMandaMuchosMensajes() {
		assertEquals(19, post.palabrasDelMensaje.size)	
	}

}
