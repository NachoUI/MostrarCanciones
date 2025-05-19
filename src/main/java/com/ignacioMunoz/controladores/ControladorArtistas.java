package com.ignacioMunoz.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;

import com.ignacioMunoz.modelos.Artista;
import com.ignacioMunoz.servicios.ServicioArtistas;

import jakarta.validation.Valid;

@Controller
public class ControladorArtistas {
	@Autowired
	private final ServicioArtistas servicioArtistas;

	public ControladorArtistas(ServicioArtistas servicioArtista) {
		this.servicioArtistas = servicioArtista;
	}

	@GetMapping("/artistas")
	public String desplegarArtistas(Model model) {
		
		List<Artista> listaDeArtistas = this.servicioArtistas.obtenerTodosLosArtistas();
		model.addAttribute("listaDeArtistas", listaDeArtistas);
		return "artistas.jsp";
	}

	@GetMapping("/artistas/detalle/{idArtista}")
	public String desplegarDetalleArtista(@PathVariable("idArtista") Long idArtista, Model model) {
	    Artista artista = this.servicioArtistas.obtenerArtistaPorId(idArtista);

	    if (artista == null) {
	        return "redirect:/artistas";
	    }

	    model.addAttribute("artista", artista); 
	    return "detalleArtista.jsp";
	}

	@GetMapping("/artistas/formulario/agregar/{idArtista}")
	public String formularioAgregarArtista(@PathVariable("idArtista") Long idArtista, Model model) {
		Artista artistaExistente = this.servicioArtistas.obtenerArtistaPorId(idArtista);

		if (artistaExistente == null) {
			model.addAttribute("artista", new Artista());
		} else {
			Artista nuevoArtista = new Artista();
			nuevoArtista.setNombre(artistaExistente.getNombre());
			nuevoArtista.setApellido(artistaExistente.getApellido());
			nuevoArtista.setBiografia(artistaExistente.getBiografia());

			model.addAttribute("artista", nuevoArtista);
		}
		return "agregarArtista.jsp";
	}

	@PostMapping("/artistas/procesa/agregar")
	public String procesarAgregarArtista(@Valid @ModelAttribute("artista") Artista nuevoArtista,
											BindingResult validacion) {
		if (validacion.hasErrors()) {
			return "agregarArtista.jsp";
		}

		this.servicioArtistas.agregarArtista(nuevoArtista);
		return "redirect:/artistas";
	}

	@GetMapping("/artistas/formulario/editar/{idArtista}")
	public String formularioEditarArtista(@PathVariable("idArtista") Long idArtista, Model model) {
		Artista artista = this.servicioArtistas.obtenerArtistaPorId(idArtista);

		if (artista == null) {
			return "redirect:/artistas";
		}

		model.addAttribute("artista", artista);
		return "editarArtista.jsp";
	}

	@PutMapping("/artistas/formulario/editar/{idArtista}")
	public String procesarEditarArtista(@Valid @ModelAttribute("artista") Artista artista,
											BindingResult validaciones,
											@PathVariable("idArtista") Long idArtista) {
		if (validaciones.hasErrors()) {
			return "editarArtista.jsp";
		}

		Artista artistaActual = this.servicioArtistas.obtenerArtistaPorId(idArtista);
		artista.setId(artistaActual.getId());
		this.servicioArtistas.actualizarArtista(artista);
		return "redirect:/artistas";
	}

	@DeleteMapping("/artistas/eliminar/{idArtista}")
	public String procesarEliminarArtista(@PathVariable("idArtista") Long idArtista) {
		this.servicioArtistas.Eliminar(idArtista);
		return "redirect:/artistas";
	}
}