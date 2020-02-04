package ar.edu.listaCorreoDecorada.listas

import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.jupiter.api.AfterEach
import org.junit.jupiter.api.BeforeEach

@Accessors
class ListaTestCase<T extends ListaCorreo> {
	
	EmailSenderMock emailSenderMock = new EmailSenderMock()
	
	T lista
	val Miembro leo = new Miembro => [
		mailDefault = "lgassman@gmail.com"
	]
	val Miembro nico = new Miembro => [
		mailDefault = "npasserini@gmail.com"
	]
	val Miembro pablo = new Miembro => [
		mailDefault = "tesonep@gmail.com"
	]
	
	@BeforeEach
	def void setUp() {
		EmailSenderProvider.setEmailSender(emailSenderMock)
	}
	
	@AfterEach
	def tearDown () {
		EmailSenderProvider.setEmailSender(null)
	}

	
}