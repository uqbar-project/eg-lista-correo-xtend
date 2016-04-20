package ar.edu.listaCorreoEnvioBloques.listas

import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.After
import org.junit.Before

@Accessors
class ListaTestCase {
	EmailSenderMock emailSenderMock = new EmailSenderMock()
	
	ListaCorreo lista
	Miembro leo = new Miembro => [
		mailDefault = "lgassman@gmail.com"
	]
	Miembro nico = new Miembro => [
		mailDefault = "npasserini@gmail.com"
	]
	Miembro pablo = new Miembro => [
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