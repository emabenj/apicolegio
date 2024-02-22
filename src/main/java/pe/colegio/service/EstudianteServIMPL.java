package pe.colegio.service;

import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.colegio.entity.Estudiante;
import pe.colegio.repository.EstudianteRep;
import pe.colegio.util.EstadoType;

@Service
public class EstudianteServIMPL{// implements EstudianteServ{	
	@Autowired
	private EstudianteRep repository;
	
	public EstudianteServIMPL() {}

	//LISTAR ALUMNOS
//	@Override @Transactional(readOnly=true)
//	public Collection<Estudiante> listar(){		
//		return repository.findAll().stream().filter(al -> !al.getEstado().equals(EstadoType.DELETED.name())).toList();
//	}
//	//LISTAR ALUMNOS by cursoId
//	@Override @Transactional(readOnly=true)
//	public Collection<Estudiante> listarPorCurso(Integer cursoId) {
//		return repository.findAll().stream()
//                .filter(alumno -> !alumno.getEstado().equals(EstadoType.DELETED.name())
//                				  && alumno.getItemsCurso().stream().anyMatch(curso-> curso.getCursoId().equals(cursoId))).toList();
//	}
//	//BUSCAR ALUMNO
//	@Override @Transactional(readOnly = true)
//	public Estudiante buscarPorId(Integer id) {
//		return repository.findById(id).orElse(null);
//	}
//	//CONTAR ALUMNOS by NivelEductativo, Grado, Seccion, Turno
//	@Override @Transactional(readOnly = true)
//	public Integer cantAlumnos(String ned, String grado, String seccion, String turno) {
//		return repository.contarAlumnos(ned, grado, seccion, turno);
//	}
//	//AGREGAR ALUMNO
//	@Override @Transactional
//	public void agregar(Estudiante alumno) {
//		alumno.setAlumnoId(null);
//		repository.save(alumno);
//	}
//	//ACTUALIZAR ALUMNO
//	@Override @Transactional
//	public void actualizar(Estudiante alumno) {
//		repository.save(alumno);		
//	}
//	//ELIMINAR ALUMNO
//	@Override @Transactional
//	public void eliminar(Integer id) {
//		//CAMBIAR ESTADO
//		Estudiante alumno = buscarPorId(id);
//		alumno.setEstado(EstadoType.DELETED.name());
//		repository.save(alumno);
//	}
}