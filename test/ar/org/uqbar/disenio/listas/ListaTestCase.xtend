package ar.org.uqbar.disenio.listas

import org.junit.Before
import org.junit.After
import ar.org.uqbar.disenio.listas.EmailSenderProvider

class ListaTestCase {
	
	@Property var emailSenderMock = new EmailSenderMock()
	
	@Property ListaCorreo lista
	@Property var leo = new Miembro => [
		mailDefault = "lgassman@gmail.com"
	]
	@Property var nico = new Miembro => [
		mailDefault = "npasserini@gmail.com"
	]
	@Property var pablo = new Miembro => [
		mailDefault = "tesonep@gmail.com"
	]
	
	@Before
	def void setUp() {
		EmailSenderProvider::setEmailSender(emailSenderMock)
	}
	
	@After
	def tearDown () {
		EmailSenderProvider::setEmailSender(null)
	}

	
}