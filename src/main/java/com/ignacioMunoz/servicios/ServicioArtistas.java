package com.ignacioMunoz.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ignacioMunoz.modelos.Artista;
import com.ignacioMunoz.modelos.Cancion;
import com.ignacioMunoz.repositorios.RepositorioArtistass;

@Service
public class ServicioArtistas {
	@Autowired
	private final RepositorioArtistass repositorioArtistass;
	
	public ServicioArtistas(RepositorioArtistass repositorioArtistass) {
		this.repositorioArtistass = repositorioArtistass;
	}
	
	public List<Artista> obtenerTodosLosArtistas(){
			return this.repositorioArtistass.findAll();
	}
	
	public Artista obtenerArtistaPorId(Long id) {
		return this.repositorioArtistass.findById(id).orElse(null);
	}
	
	public Artista agregarArtista(Artista nuevoArtista) {
		return this.repositorioArtistass.save(nuevoArtista);
	}
	
	public Artista actualizarArtista(Artista nuevoArtista) {
		return this.repositorioArtistass.save(nuevoArtista);
	}
	
	
	public void Eliminar(Long id) {
		this.repositorioArtistass.deleteById(id);
	}
	
	
	
	
}
