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

import com.ignacioMunoz.modelos.Cancion;
import com.ignacioMunoz.servicios.ServicioCanciones;

import jakarta.validation.Valid;

@Controller
public class ControladorCanciones {
	@Autowired
	private final ServicioCanciones servicioCanciones;
	
	public ControladorCanciones(ServicioCanciones servicioCanciones) {
		this.servicioCanciones = servicioCanciones;
	}
	
	
	@GetMapping("/canciones")
	public String desplegarCanciones(Model model) {
		List<Cancion> listaDeCanciones = this.servicioCanciones.obtenerTodasLasCanciones();
		Cancion ultimaCancion = listaDeCanciones.get(listaDeCanciones.size() - 1);
		
		model.addAttribute("listaDeCancions", listaDeCanciones);
		model.addAttribute("ultimaCancion", ultimaCancion);
		return "canciones.jsp";
	}
	
	@GetMapping("/canciones/detalle/{idCancion}")
	public String desplegarDetalleCancion(@PathVariable("idCancion") Long idCancion, Model model) {
		Cancion cancion = this.servicioCanciones.obtenerCancionPorId(idCancion);
		
		if (cancion == null) {
			return "redirect:/canciones"; 
		}	
		
		model.addAttribute("cancion", cancion);
		return "detalleCancion.jsp";
	}
	
	
	@GetMapping("/canciones/formulario/agregar/{idCancion}")
	public String formularioAgregarCancion(@PathVariable("idCancion") Long idCancion, Model model) {
	    Cancion cancionExistente = this.servicioCanciones.obtenerCancionPorId(idCancion);

	    if (cancionExistente == null) {
	        model.addAttribute("cancion", new Cancion()); 
	    } else {
	  
	        Cancion nuevaCancion = new Cancion();
	        nuevaCancion.setTitulo(cancionExistente.getTitulo());
	        nuevaCancion.setBanda(cancionExistente.getBanda());
	        nuevaCancion.setAlbum(cancionExistente.getAlbum());
	        nuevaCancion.setGenero(cancionExistente.getGenero());
	        nuevaCancion.setIdioma(cancionExistente.getIdioma());

	        model.addAttribute("cancion", nuevaCancion);
	    }

	    return "agregarCancion.jsp";
	}
	
	
	@PostMapping("/canciones/procesa/agregar")
	public String procesarAgregarCancion(@Valid @ModelAttribute("cancion") Cancion nuevaCancion,
										BindingResult validacion) {
		
		
		if(validacion.hasErrors()) {
			return "agregarCancion.jsp";
		}
		
		
		this.servicioCanciones.agregarCancion(nuevaCancion);
		return "agregarCancion.jsp";
	}
	
	
}
