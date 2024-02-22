package pe.colegio.entity;

import java.io.Serializable;
import java.time.LocalDate;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "mensajes")
public class Mensaje implements Serializable{
	private static final long serialVersionUID = 1L;

	public Mensaje() {}
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mensajeId;

	@Column(nullable = false)
	private String contenido;
	@Column @DateTimeFormat(pattern="yyyy-MM-dd",iso=ISO.DATE_TIME)
	private LocalDate fechaHora;
	
	@JsonBackReference @ManyToOne @JoinColumn(name = "apoderado_id", nullable = false)
    private Apoderado apoderado;
	
	@JsonBackReference @ManyToOne @JoinColumn(name = "docente_id", nullable = false)
    private Docente docente;

	public Mensaje(String contenido, LocalDate fechaHora) {
		super();
		this.contenido = contenido;
		this.fechaHora = fechaHora;
	}

	public Integer getMensajeId() {
		return mensajeId;
	}

	public void setMensajeId(Integer mensajeId) {
		this.mensajeId = mensajeId;
	}

	public String getContenido() {
		return contenido;
	}

	public void setContenido(String contenido) {
		this.contenido = contenido;
	}

	public LocalDate getFechaHora() {
		return fechaHora;
	}

	public void setFechaHora(LocalDate fechaHora) {
		this.fechaHora = fechaHora;
	}

	public Apoderado getApoderado() {
		return apoderado;
	}

	public void setApoderado(Apoderado apoderado) {
		this.apoderado = apoderado;
	}

	public Docente getDocente() {
		return docente;
	}

	public void setDocente(Docente docente) {
		this.docente = docente;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}		
}