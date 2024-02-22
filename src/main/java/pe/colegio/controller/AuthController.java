package pe.colegio.controller;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import pe.colegio.entity.*;
import pe.colegio.repository.*;
import pe.colegio.security.JwtAuthResponse;
import pe.colegio.security.JwtTokenProvider;
import pe.colegio.service.UsuarioServ;
import pe.colegio.util.EstadoType;

@RestController @RequestMapping("/auth")
public class AuthController {

	@Autowired
	private AuthenticationManager authenticationManager;
	
	@Autowired
	private UsuarioRep repository;
	
	@Autowired
	private Rol_UsuarioRep rolRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private JwtTokenProvider jwtTokenProvider;
	
	@Autowired
	private UsuarioServ service;
	
	public AuthController() {}

	// AUTHENTICACION
	@PostMapping("/login")
	public ResponseEntity<JwtAuthResponse> iniciarSesion(@RequestBody Usuario usuario) {
		String email = usuario.getEmail();
		String pass = usuario.getContrasena();
		
		Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(email, pass));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		//Token del jwtTokenProvider
		String token = jwtTokenProvider.generarToken(authentication);
		
		return ResponseEntity.ok(new JwtAuthResponse(token));
	}
	
	// AGREGAR USUARIO
	@PostMapping("/register")
	public ResponseEntity<?> agregarUsuario(@RequestBody Usuario usuario) {
		if(repository.existsByEmail(usuario.getEmail())) {
			return new ResponseEntity<>("El correo ya se encuentra registrado.", HttpStatus.BAD_REQUEST);
		}

		usuario.setContrasena(passwordEncoder.encode(usuario.getContrasena()));
		
		Rol_Usuario roles = rolRepository.findById(2).get();
		usuario.setItemsRole(Collections.singleton(roles));
		
		repository.save(usuario);
		return new ResponseEntity<>("Usuario registrado exitosamente", HttpStatus.OK);
	}
	
	// LISTAR
	@GetMapping("/listar")
	public ResponseEntity<Collection<Usuario>> listarUsuarios(@RequestParam(required = false, value = "eliminados")Boolean eliminado){
		eliminado = eliminado == null ? false : eliminado;
		Collection<Usuario> usuarios = eliminado ? service.listarEliminados() : service.listar();
		return ResponseEntity.ok(usuarios);
	}
	// BUSCAR POR ID, USUARIO
	@GetMapping("/buscar")
	public ResponseEntity<?> obtenerUsuario(
			@RequestParam(required = false, value = "id")Integer id,
			@RequestParam(required = false, value = "correo")String correo) {

		Usuario usuario = null;
		if (id != null) { usuario = service.buscarPorId(id); }
		else if(correo != null) { usuario = service.buscarPorCorreo(correo); }
		
		if(usuario != null) { return ResponseEntity.ok(usuario); }
		return ResponseEntity.notFound().build();
	}
	// ACTUALIZAR USUARIO
	@PutMapping("/actualizar")
	public ResponseEntity<?> actualizarUsuario(@RequestBody Usuario usuario, @RequestParam(required = false, value = "docente")Boolean docente) {
		if(service.buscarPorId(usuario.getUsuarioId()) != null) {
			service.actualizar(usuario, docente == null ? false : docente);
			return ResponseEntity.ok("Usuario actualizado.");
		}
		return ResponseEntity.notFound().build();
	}
	// ELIMINAR USUARIO
	@DeleteMapping("/eliminar/{id}")
	public ResponseEntity<String> eliminarUsuario(@PathVariable("id") Integer id) {
//		Usuario usuario = service.buscarPorId(id);
//		if(usuario != null) {
//			if(!usuario.getEstado().equals(EstadoType.DELETED.name())) {
//				service.eliminar(usuario.getUser());
//				return ResponseEntity.ok("Usuario eliminado.");
//			} else{
//				return ResponseEntity.ok("El usuario ya se encuentra eliminado.");
//			}
//		}
		return ResponseEntity.notFound().build();
	}
	
	
	// JS
	@GetMapping("/cambiarEstado")
	public ResponseEntity<Boolean> cambiarEstado(
			@RequestParam(required = true, value = "id")Integer id,
			@RequestParam(required = true, value = "estado")String estado){
	    
	    Usuario usuario = service.buscarPorId(id);
	    Boolean validacion = usuario != null;
	    if (validacion) {
	    	usuario.setEstado(estado);
			service.actualizar(usuario, false);
	    }		
		return ResponseEntity.ok(validacion);
	}
}