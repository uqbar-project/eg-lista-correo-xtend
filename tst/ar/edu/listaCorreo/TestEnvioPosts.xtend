package ar.edu.listaCorreo

import ar.edu.listaCorreo.exceptions.BusinessException
import org.junit.Before
import org.junit.Test
import org.junit.Assert
import ar.edu.listaCorreo.observers.MockMailSender
import ar.edu.listaCorreo.observers.MalasPalabrasObserver
import ar.edu.listaCorreo.observers.MailObserver

class TestEnvioPosts {
	
	Lista listaProfes
	Lista listaAlumnos
	Miembro dodain
	Miembro nico
	Miembro deby
	Miembro alumno
	Miembro fede
	Post mensajeAlumno
	Post mensajeDodainAlumnos
	Post mensajeDodainProfes
	MockMailSender mockMailSender = new MockMailSender
	MalasPalabrasObserver malasPalabrasObserver = new MalasPalabrasObserver
		
	@Before
	def void init() {
		/** Listas de correo */
		listaAlumnos = Lista::listaAbierta()
		listaProfes = Lista::listaCerrada()
		/** Profes */
		dodain = new Miembro("fernando.dodino@gmail.com")
		nico = new Miembro("nicolas.passerini@gmail.com")
		deby = new Miembro("debyfortini@gmail.com")
		/** Alumnos **/
		alumno = new Miembro("alumno@uni.edu.ar")
		fede = new Miembro("fede@uni.edu.ar")
		/** en la lista de profes están los profes */
		listaProfes.agregarMiembro(dodain)
		listaProfes.agregarMiembro(nico)
		listaProfes.agregarMiembro(deby)
		listaProfes.agregarPostObserver(new MailObserver(mockMailSender))
		/** en la de alumnos hay alumnos y profes */
		listaAlumnos.agregarMiembro(dodain)
		listaAlumnos.agregarMiembro(deby)
		listaAlumnos.agregarMiembro(fede)
		listaAlumnos.agregarPostObserver(new MailObserver(mockMailSender))
		listaAlumnos.agregarPostObserver(malasPalabrasObserver)
		
		mensajeAlumno = new Post(alumno, "Hola, queria preguntar que es la recursividad", listaProfes)
		mensajeDodainAlumnos = new Post(dodain, "Para explicarte recursividad tendría que explicarte qué es la recursividad", listaAlumnos)
		mensajeDodainProfes = new Post(dodain, "Cuantos TPs hacemos?", listaProfes)
	}
	
	@Test(expected=typeof(BusinessException))
	def void alumnoNoPuedeEnviarPostAListaProfes() {
		listaProfes.enviar(mensajeAlumno)
	}
	
	@Test
	def void alumnoPuedeEnviarMailAListaAbierta() {
		Assert::assertEquals(0, mockMailSender.mailsDe("alumno@uni.edu.ar").size)
		listaAlumnos.enviar(mensajeAlumno)
		Assert::assertEquals(1, mockMailSender.mailsDe("alumno@uni.edu.ar").size)
	}

	@Test
	def void alumnoEnviaMailConMalaPalabra() {
		val mensajeFeo = new Post(alumno, "Cuál es loco! Me tienen podrido", listaAlumnos)
		malasPalabrasObserver.agregarMalaPalabra("podrido")
		listaAlumnos.enviar(mensajeFeo)
		Assert::assertEquals(1, malasPalabrasObserver.mensajesConMalasPalabras.size)
	}

}