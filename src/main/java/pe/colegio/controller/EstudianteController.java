package pe.colegio.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import pe.colegio.entity.*;
import pe.colegio.service.*;
import pe.colegio.util.EstadoType;

//@RestController @RequestMapping("/alumnos")
public class EstudianteController {
	@Autowired
	private EstudianteServ service;
	@Autowired
	private CursoServ cursoService;
	
	// LISTAR
	@PreAuthorize("hasRole('DOCENTE') or hasRole('ADMIN')")
	@GetMapping
	public ResponseEntity<Collection<Estudiante>> listarAlumnos(@RequestParam(required = false, value = "cursoId")Integer id){
		Collection<Estudiante> alumnos = new ArrayList<>();
		if (id != null){
			if (cursoService.buscarPorId(id) == null) {
				HttpHeaders headers = new HttpHeaders();
				headers.set("message", "Curso no encontrado.");
				return ResponseEntity.notFound().headers(headers).build();
			}
			alumnos = service.listarPorCurso(id);
			
		}else{
			alumnos = service.listar();
		}
		return ResponseEntity.ok(alumnos);
	}
	// BUSCAR POR ID
	@PreAuthorize("hasRole('ADMIN', 'DOCENTE')")
	@GetMapping("/{id}")
	public ResponseEntity<Estudiante> obtenerAlumno(@PathVariable("id") Integer id) {
		if (id != null) {
			Estudiante alumno = service.buscarPorId(id);
			if(alumno != null) { return ResponseEntity.ok(alumno); }						
		}return ResponseEntity.notFound().build();
	}
	// AGREGAR ALUMNO
	@PreAuthorize("hasRole('ADMIN', 'DOCENTE')")
	@PostMapping
	public ResponseEntity<Estudiante> agregarAlumno(@RequestBody Estudiante alumno) {
		service.agregar(alumno);
		return new ResponseEntity<Estudiante>(alumno, HttpStatus.CREATED);
	}
	// ACTUALIZAR ALUMNO
//	@PreAuthorize("hasRole('ADMIN', 'DOCENTE')")	
//	@PutMapping
//	public ResponseEntity<?> actualizarAlumno(@RequestBody Estudiante alumno) {
//		if(service.buscarPorId(alumno.getAlumnoId()) != null) {
//			service.actualizar(alumno);
//			return ResponseEntity.ok("Alumno actualizado.");
//		}
//		return ResponseEntity.notFound().build();
//	}
	// ELIMINAR ALUMNO
//	@PreAuthorize("hasRole('ADMIN', 'DOCENTE')")
//	@DeleteMapping("/{id}")
//	public ResponseEntity<?> eliminarAlumno(@PathVariable("id") Integer id) {
//		Estudiante alumno = service.buscarPorId(id); 
//		if(alumno != null) {
//			if(!alumno.getEstado().equals(EstadoType.DELETED.name())) {
//				service.eliminar(id);
//				return ResponseEntity.ok("Alumno eliminado.");				
//			}else {
//				return ResponseEntity.ok("El alumno ya se encuentra eliminado.");
//			}
//		}	
//		return ResponseEntity.notFound().build();
//	}
	// EVALUAR ALUMNO PARA ASIGNAR SECCION
//	@PreAuthorize("hasRole('ADMIN', 'DOCENTE')")
//	@GetMapping("/seccion")
//	public ResponseEntity<?> evaluarAlumno(@RequestParam(value="ne")String ne, @RequestParam(value="gr")String gr,
//			@RequestParam(value="scc")String scc, @RequestParam(value="tn")String tn){
//		
//		Integer numAlumnos = service.cantAlumnos(ne, gr, scc, tn);
//		if (numAlumnos < 5) { return ResponseEntity.ok(true); }
//		else if(numAlumnos == 5) { return ResponseEntity.ok(false); }
//		else { return ResponseEntity.notFound().build(); }
//	}
}
