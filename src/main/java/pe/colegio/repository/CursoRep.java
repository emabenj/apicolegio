package pe.colegio.repository;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pe.colegio.entity.Curso;

public interface CursoRep extends JpaRepository<Curso, Integer> {	
	@Query(value = "SELECT * from cursos WHERE niv_educativo=:ne AND turno=:tn", nativeQuery = true)
	public abstract Collection<Curso> findByNet(@Param("ne")String ne, @Param("tn")String tn);
}
