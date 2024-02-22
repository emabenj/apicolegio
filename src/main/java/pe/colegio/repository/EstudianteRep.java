package pe.colegio.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pe.colegio.entity.Estudiante;

public interface EstudianteRep extends JpaRepository<Estudiante, Integer>{
	@Query(value = "SELECT COUNT(*) FROM alumnos WHERE (:ned IS NULL OR n_educativo=:ned) AND (:grado IS NULL OR grado=:grado) AND (:seccion IS NULL OR seccion=:seccion) AND (:turno IS NULL OR turno=:turno)", nativeQuery = true)
	Integer contarAlumnos(@Param("ned")String ned,@Param("grado") String grado,@Param("seccion") String seccion,@Param("turno") String turno);
}
