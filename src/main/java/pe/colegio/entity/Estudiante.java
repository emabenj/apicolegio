package pe.colegio.entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import com.fasterxml.jackson.annotation.JsonBackReference;

import pe.colegio.util.EstadoType;

@Entity @Table(name = "estudiantes")
public class Estudiante implements Serializable{
	private static final long serialVersionUID = 1L;
	
	public Estudiante() {}
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer estudianteId;
	
	@Column
	private String nombres;
	@Column
	private String apellidos;
	@Column @DateTimeFormat(pattern="yyyy-MM-dd",iso=ISO.DATE)
	private LocalDate fechaNacimiento;
	@Column
	private Character genero;
	
	@Column 
	private Integer grado;
	@Column
	private Character seccion;	
	@Column
	private Character nivelEducativo;

	@Column @DateTimeFormat(pattern="yyyy-MM-dd",iso=ISO.DATE)
	private LocalDate fechaInscripcion;

	@Column
	private String estado = EstadoType.ACTIVE.name();

	@JsonBackReference @ManyToOne @JoinColumn(name = "apoderado_id", nullable = false)
    private Apoderado apoderado;
	
	@JsonBackReference @ManyToMany @JoinTable(name = "estudiantes_cursos", joinColumns = @JoinColumn(name="estudiante_id"),
			   inverseJoinColumns = @JoinColumn(name="curso_id"))
	private Set<Curso> itemsCurso = new HashSet<>();
	
	@OneToMany(mappedBy = "estudiante")
	private Collection<Calificacion> calificaciones = new ArrayList<>();
	

	@ManyToMany(mappedBy = "itemsEstudiante")
	private Set<Asistencia> itemsAsistencia = new HashSet<>();
	
		
}