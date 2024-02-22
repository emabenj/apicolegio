package pe.colegio.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "cursos")
public class Curso implements Serializable{
	private static final long serialVersionUID = 1L;
	
	public Curso() {}
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cursoId;
	
	@Column
	private String nombre;
	@Column
	private Character nivelEducativo;
	@Column
	private String dia;

	@JsonBackReference @ManyToMany(mappedBy = "itemsCurso")
	private Set<Estudiante> itemsEstudiante = new HashSet<>();

	@JsonBackReference @ManyToMany(mappedBy = "itemsCurso")
	private Set<Estudiante> itemsTareas = new HashSet<>();
	
	@JsonBackReference @JsonIgnore @OneToMany(mappedBy = "curso")
	private Collection<Docente> docentes = new ArrayList<>();

	@JsonBackReference @JsonIgnore @OneToMany(mappedBy = "curso")
	private Collection<Calificacion> calificaciones = new ArrayList<>();
	
	@JsonBackReference @JsonIgnore @OneToMany(mappedBy = "curso")
	private Collection<Horario> horarios = new ArrayList<>();


	public Curso(String nombre, Character nivelEducativo, String dia) {
		super();
		this.nombre = nombre;
		this.nivelEducativo = nivelEducativo;
		this.dia = dia;
	}

	public Curso(Integer cursoId) {
		super();
		this.cursoId = cursoId;
	}

	public Integer getCursoId() {
		return cursoId;
	}

	public void setCursoId(Integer cursoId) {
		this.cursoId = cursoId;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Collection<Docente> getDocentes() {
		return docentes;
	}

	public void setDocentes(Collection<Docente> docentes) {
		this.docentes = docentes;
	}

	public Collection<Calificacion> getCalificaciones() {
		return calificaciones;
	}

	public void setCalificaciones(Collection<Calificacion> calificaciones) {
		this.calificaciones = calificaciones;
	}

	public Set<Estudiante> getItemsEstudiante() {
		return itemsEstudiante;
	}

	public void setItemsEstudiante(Set<Estudiante> itemsEstudiante) {
		this.itemsEstudiante = itemsEstudiante;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}