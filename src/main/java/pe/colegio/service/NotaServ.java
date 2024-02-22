package pe.colegio.service;

import pe.colegio.entity.Calificacion;

public interface NotaServ {
	public abstract Calificacion buscarPorId(Integer id);
	public abstract Calificacion buscarPorAlumnoYCurso(Integer alumnoId, Integer cursoId);
	
	public abstract void agregar(Calificacion nota);
	public abstract void actualizar(Calificacion nota);
	public abstract void eliminar(Integer id);
}
