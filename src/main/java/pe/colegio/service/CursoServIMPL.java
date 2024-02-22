package pe.colegio.service;

import java.util.Collection;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.colegio.entity.Curso;
import pe.colegio.repository.CursoRep;

@Service
public class CursoServIMPL{// implements CursoServ {
	@Autowired
	private CursoRep repository;

	// BUSCAR POR ID
//	@Override @Transactional(readOnly = true)
//	public Curso buscarPorId(Integer id) {
//		return repository.findById(id).orElse(null);
//	}
//	// LISTAR CONJUNTO DE CURSOS
//	@Override @Transactional(readOnly = true)
//	public Collection<Curso> listarPorAlumnoId(Integer alumnoId) {
//		return repository.findAll().stream()
//                .filter(curso -> curso.getItemsAlumno().stream()
//                .anyMatch(alumno -> alumno.getAlumnoId().equals(alumnoId)))
//                .collect(Collectors.toList());
//	}
//	// LISTAR CURSOS
//	@Override @Transactional(readOnly = true)
//	public Collection<Curso> listar(String nivelEducativo, String turno, String dia) {
//		Collection<Curso> cursos = repository.findAll();
//		if(!((nivelEducativo + turno + dia).isEmpty())) {
//			cursos = cursos.stream().filter(c -> 
//			c.getNiv_educativo().equals(nivelEducativo) && c.getTurno().equals(turno) && c.getDia().equals(dia)).collect(Collectors.toList());
//		}
//		return cursos;
//	}
//
//	// AGREGAR CONJUNTO DE CURSOS
//	@Override @Transactional
//	public void agregar(Curso curso) {
//		curso.setCursoId(null);
//		repository.save(curso);
//	}
//
//	// ACTUALIZAR CONJUNTO DE CURSOS
//	@Override @Transactional
//	public void actualizar(Curso curso) {
//		repository.save(curso);
//	}
//
//	// ELIMINAR CONJUNTO DE CURSOS
//	@Override @Transactional
//	public void eliminar(Integer id) {
//		repository.deleteById(id);
//	}
}