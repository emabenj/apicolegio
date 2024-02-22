package pe.colegio.service;

import java.util.Collection;

import pe.colegio.entity.Estudiante;

public interface EstudianteServ {
	public abstract Estudiante buscarPorId(Integer id);
	public abstract Collection<Estudiante> listar();
	public abstract Collection<Estudiante> listarPorCurso(Integer cursoId);
	
	public abstract void agregar(Estudiante alumno);
	public abstract void actualizar(Estudiante alumno);
	public abstract void eliminar(Integer id);
	
	public abstract Integer cantAlumnos(String ned, String grado, String seccion, String turno);
}
