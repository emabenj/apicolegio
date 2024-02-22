package pe.colegio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import pe.colegio.entity.Calificacion;
import pe.colegio.service.NotaServ;

//@RestController @RequestMapping("/notas")
public class CalificacionController {
	@Autowired
	private NotaServ service;
	
	public CalificacionController() {}
	
	// BUSCAR POR ALUMNOID Y CURSOID
	@PreAuthorize("hasRole('APOD') or hasRole('DOC')")
	@GetMapping
	public ResponseEntity<Calificacion> obtenerNotaPorAlumnoYCurso(
			@RequestParam("alumno") Integer alumnoId,
			@RequestParam("curso") Integer cursoId) {
		
    	Calificacion nota = service.buscarPorAlumnoYCurso(alumnoId, cursoId);    	
		if(nota != null) { return ResponseEntity.ok(nota); }
		return ResponseEntity.notFound().build();
	}
}