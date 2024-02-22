package pe.colegio.entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "asistencias")
public class Asistencia implements Serializable{
	private static final long serialVersionUID = 1L;
	
	public Asistencia() {}

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY )
	private Integer asistenciaId;

	@Column
	private Character estado;
	
	@DateTimeFormat(pattern="yyyy-MM-dd",iso=ISO.DATE)
	private LocalDate fecha;

	@Column
	private String justificacion = "";

	@JsonBackReference @ManyToMany(fetch = FetchType.EAGER) @JsonIgnore @JoinTable(name = "asistencias_estudiantes", joinColumns = @JoinColumn(name="asistencia_id"),
			inverseJoinColumns = @JoinColumn(name="estudiante_id"))	
	private Set<Estudiante> itemsEstudiante = new HashSet<>();
	

	public Asistencia( LocalDate fecha, Character estado, String justificacion) {
		super();
		this.fecha = fecha;
		this.estado = estado;
		this.justificacion = justificacion;
	}


	public Integer getAsistenciaId() {
		return asistenciaId;
	}

	public void setAsistenciaId(Integer asistenciaId) {
		this.asistenciaId = asistenciaId;
	}

	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public Character getEstado() {
		return estado;
	}

	public void setEstado(Character estado) {
		this.estado = estado;
	}

	public String getJustificacion() {
		return justificacion;
	}

	public void setJustificacion(String justificacion) {
		this.justificacion = justificacion;
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