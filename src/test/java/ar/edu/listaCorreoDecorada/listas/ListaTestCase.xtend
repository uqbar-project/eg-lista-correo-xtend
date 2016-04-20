package ar.edu.listaCorreoDecorada.listas

import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.After
import org.junit.Before

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
	
	@Before
	def void setUp() {
		EmailSenderProvider.setEmailSender(emailSenderMock)
	}
	
	@After
	def tearDown () {
		EmailSenderProvider.setEmailSender(null)
	}

	
}