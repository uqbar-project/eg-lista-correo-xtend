package ar.org.uqbar.disenio.listas.decorator;

import java.util.List;

public class ListaCerradaRestringida extends ListaCorreoRestringida implements ListaCerrada {

	private ListaCerradaImpl listaCerradaDecorada;

	public ListaCerradaRestringida(ListaCerradaImpl listaDecorada) {
		super(listaDecorada);
		this.listaCerradaDecorada = listaDecorada;
	}

	@Override
	public void aprobar(Miembro miembro) {
		this.listaCerradaDecorada.aprobar(miembro);
	}

	@Override
	public void rechazar(Miembro miembro) {
		this.listaCerradaDecorada.rechazar(miembro);
	}

	@Override
	public List<Miembro> getMiembrosPendientes() {
		return this.listaCerradaDecorada.getMiembrosPendientes();
	}
	
	

}
