package pe.colegio.controller;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import pe.colegio.entity.*;
import pe.colegio.repository.UsuarioRep;
import pe.colegio.service.*;
import pe.colegio.util.FiltroCD;

@RestController @RequestMapping("/apoderados")
public class ApoderadoController {
	@Autowired
	private ApoderadoServ service;
	@Autowired
	private UsuarioRep usuarioRep;
	
	public ApoderadoController() {}

	// LISTAR APODERADOS
	@PreAuthorize("hasRole('ADMIN') or hasRole('APOD')")
	@GetMapping
	public ResponseEntity<Collection<Apoderado>> listarApoderados(
			@RequestBody(required = false) FiltroCD requests){        
		Collection<Apoderado> apoderados = service.listar();
		return ResponseEntity.ok(apoderados);
	}
	// BUSCAR POR ID
	@PreAuthorize("hasRole('ADMIN') or hasRole('APOD')")
	@GetMapping("/{id}")
	public ResponseEntity<Apoderado> obtenerapoderado(@PathVariable("id") Integer apoderadoId) {
		Apoderado apoderado = service.buscarPorId(apoderadoId);
		if(apoderado != null) { return ResponseEntity.ok(apoderado); }
		return ResponseEntity.notFound().build();
	}
	// AGREGAR APODERADO
	@PreAuthorize("hasRole('ADMIN')")
	@PostMapping
	public ResponseEntity<?> agregarApoderado(@RequestBody Apoderado apoderado) {
		if(usuarioRep.existsByEmail(apoderado.getCorreo()) && service.buscarPorCorreo(apoderado.getCorreo()) != null) {
			return new ResponseEntity<>("El correo ya se encuentra registrado.", HttpStatus.BAD_REQUEST);
		}
		service.agregar(apoderado);
		return new ResponseEntity<Apoderado>(apoderado, HttpStatus.CREATED);
	}
	// ACTUALIZAR APODERADO
	@PreAuthorize("hasRole('APOD')")
	@PutMapping
	public ResponseEntity<?> actualizarApoderado(@RequestBody Apoderado apoderado) {
		if(usuarioRep.existsByEmail(apoderado.getCorreo()) && service.buscarPorCorreo(apoderado.getCorreo()) != null) {
			service.actualizar(apoderado);
			return ResponseEntity.ok("Apoderado actualizado.");
		}
		return ResponseEntity.notFound().build();
	}
	// ELIMINAR APODERADO
//	@PreAuthorize("hasRole('ADMIN') or hasRole('apoderado')")
//	@DeleteMapping("/{id}")
//	public ResponseEntity<?> eliminarApoderado(@PathVariable("id") String cod) {
//		apoderado apoderado = service.buscarPorId(cod);
//		if(apoderado != null) {
//			if(!apoderado.getEstado().equals(EstadoType.DELETED.name())) {
//				service.eliminar(apoderado.getapoderado_cod());
//				return ResponseEntity.ok("apoderado eliminado.");
//			} else{
//				return ResponseEntity.ok("El apoderado ya se encuentra eliminado.");
//			}			
//		}
//		return ResponseEntity.notFound().build();
//	}
}
