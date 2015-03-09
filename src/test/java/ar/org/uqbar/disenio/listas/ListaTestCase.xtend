package ar.org.uqbar.disenio.listas

import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.After
import org.junit.Before

@Accessors
class ListaTestCase {
	
	var EmailSenderMock emailSenderMock = new EmailSenderMock()
	
	ListaCorreo lista
	var Miembro leo = new Miembro => [
		mailDefault = "lgassman@gmail.com"
	]
	var Miembro nico = new Miembro => [
		mailDefault = "npasserini@gmail.com"
	]
	var Miembro pablo = new Miembro => [
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