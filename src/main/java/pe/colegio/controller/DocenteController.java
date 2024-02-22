package pe.colegio.controller;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import pe.colegio.entity.*;
import pe.colegio.repository.UsuarioRep;
import pe.colegio.service.*;
import pe.colegio.util.EstadoType;
import pe.colegio.util.FiltroCD;

@RestController @RequestMapping("/docentes")
public class DocenteController {
	@Autowired
	private DocenteServ service;
	@Autowired
	private UsuarioRep usuarioRep;
	
	public DocenteController() {}

	// LISTAR
//	@PreAuthorize("hasRole('ADMIN') or hasRole('DOCENTE')")
//	@PutMapping("/listar")
//	public ResponseEntity<Collection<Docente>> listarDocentes(
//			@RequestBody(required = false) FiltroCD requests){
//        
//		Collection<Docente> docentes = new ArrayList<>();
//		if (requests != null) {
//			System.out.println("SE BUSCARAN LOS DOCENTES A PARTIR DE LOS FILTROS");
//	        Curso curso = requests.getCurso();
//			Docente docente = requests.getDocente();
//			if(curso != null && docente != null) {
//		        docentes = service.filtrarByInfo(curso, docente);
//			}			
//		}else{
//			docentes = service.listar();
//		}
//		return ResponseEntity.ok(docentes);
//	}
	// BUSCAR POR ID
//	@PreAuthorize("hasRole('ADMIN') or hasRole('DOCENTE')")
//	@GetMapping("/{id}")
//	public ResponseEntity<Docente> obtenerDocente(@PathVariable("id") String cod) {
//		Docente docente = service.buscarPorId(cod);
//		if(docente != null) { return ResponseEntity.ok(docente); }
//		return ResponseEntity.notFound().build();
//	}
	// AGREGAR DOCENTE
	@PreAuthorize("hasRole('ADMIN')")
	@PostMapping
	public ResponseEntity<?> agregarDocente(@RequestBody Docente docente) {
		if(usuarioRep.existsByEmail(docente.getCorreo()) && service.buscarPorCorreo(docente.getCorreo()) != null) {
			return new ResponseEntity<>("El correo ya se encuentra registrado.", HttpStatus.BAD_REQUEST);
		}
		service.agregar(docente);
		return new ResponseEntity<Docente>(docente, HttpStatus.CREATED);
	}
	// ACTUALIZAR DOCENTE
	@PreAuthorize("hasRole('DOC')")
	@PutMapping
	public ResponseEntity<?> actualizarDocente(@RequestBody Docente docente) {
		if(usuarioRep.existsByEmail(docente.getCorreo()) && service.buscarPorCorreo(docente.getCorreo()) != null) {
			service.actualizar(docente);
			return ResponseEntity.ok("Docente actualizado.");
		}
		return ResponseEntity.notFound().build();
	}
	// ELIMINAR DOCENTE
//	@PreAuthorize("hasRole('ADMIN') or hasRole('DOCENTE')")
//	@DeleteMapping("/{id}")
//	public ResponseEntity<?> eliminarDocente(@PathVariable("id") String cod) {
//		Docente docente = service.buscarPorId(cod);
//		if(docente != null) {
//			if(!docente.getEstado().equals(EstadoType.DELETED.name())) {
//				service.eliminar(docente.getDocente_cod());
//				return ResponseEntity.ok("Docente eliminado.");
//			} else{
//				return ResponseEntity.ok("El docente ya se encuentra eliminado.");
//			}			
//		}
//		return ResponseEntity.notFound().build();
//	}
}
