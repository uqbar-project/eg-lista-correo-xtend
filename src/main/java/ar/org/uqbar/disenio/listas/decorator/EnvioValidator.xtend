package ar.org.uqbar.disenio.listas.decorator

interface EnvioValidator {
	def void validate(Post post, ListaCorreoImpl lista)
}
