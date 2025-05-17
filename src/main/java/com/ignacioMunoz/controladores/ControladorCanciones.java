package com.ignacioMunoz.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.ignacioMunoz.modelos.Cancion;
import com.ignacioMunoz.servicios.ServicioCanciones;

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
		model.addAttribute("listaDeCancions", listaDeCanciones);
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
	
}
