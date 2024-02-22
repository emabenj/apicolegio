package pe.colegio.service;

import java.util.Collection;

import pe.colegio.entity.Apoderado;

public interface ApoderadoServ {
	public abstract Apoderado buscarPorId(Integer ApoderadoId);
	public abstract Apoderado buscarPorCorreo(String correo);
	public abstract Collection<Apoderado> listar();
//	
	public abstract void agregar(Apoderado Apoderado);
	public abstract void actualizar(Apoderado Apoderado);
//	public abstract void eliminar(Integer ApoderadoId);
	
//	public abstract Collection<Apoderado> filtrarByInfo(Curso curso, Apoderado Apoderado);
}
