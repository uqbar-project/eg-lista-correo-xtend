package ar.org.uqbar.disenio.listas.decorator

import org.junit.After
import org.junit.Before

class ListaTestCase<T extends ListaCorreo> {
	
	@Property var emailSenderMock = new EmailSenderMock();
	
	@Property T lista;
	@Property var leo = new Miembro => [
		mailDefault = "lgassman@gmail.com";
	]
	@Property var nico = new Miembro => [
		mailDefault = "npasserini@gmail.com";
	]
	@Property var pablo = new Miembro => [
		mailDefault = "tesonep@gmail.com";
	]
	
	@Before
	def void setUp() {
		EmailSenderProvider::setEmailSender(emailSenderMock);
	}
	
	@After
	def tearDown () {
		EmailSenderProvider::setEmailSender(null);
	}

	
}