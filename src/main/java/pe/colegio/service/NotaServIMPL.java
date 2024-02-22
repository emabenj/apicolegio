package pe.colegio.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.colegio.entity.Calificacion;
import pe.colegio.repository.CalificacionRep;

@Service
public class NotaServIMPL implements NotaServ{
	@Autowired
	private CalificacionRep repository;
	
	public NotaServIMPL() {}

	// BUSCAR NOTAS
	@Override @Transactional(readOnly = true)
	public Calificacion buscarPorId(Integer id) {
		return repository.findById(id).orElse(null);
	}
	// BUSCAR NOTAS by alumnoId, cursoId
	@Override @Transactional(readOnly = true)
	public Calificacion buscarPorAlumnoYCurso(Integer alumnoId, Integer cursoId) {
		return repository.findByAlCurIds(alumnoId, cursoId);
	}

	// AGREGAR CONJUNTO DE NOTAS
	@Override @Transactional
	public void agregar(Calificacion nota) {
		repository.save(nota);
	}

	// ACTUALIZAR CONJUNTO DE NOTAS
	@Override @Transactional
	public void actualizar(Calificacion nota) {
		repository.save(nota);
	}

	// ELIMINAR CONJUNTO DE NOTAS
	@Override @Transactional
	public void eliminar(Integer id) {
		repository.deleteById(id);
	}
}
