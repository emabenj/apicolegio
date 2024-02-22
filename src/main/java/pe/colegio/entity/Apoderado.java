package pe.colegio.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "apoderados")
public class Apoderado implements Serializable{
	private static final long serialVersionUID = 1L;

	public Apoderado() {}
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY )
	private Integer apoderadoId;
	
	@Column(nullable = false)
	private String nombres;
	@Column(nullable = false)
	private String apellidos;
	
	@Column(unique = true, nullable = false)
	private String correo;
	@Column(unique = true, nullable = false)
	private Integer telefono;	
	@Column(nullable = false)
	private String direccion;

	@JsonBackReference @OneToOne @JoinColumn(name = "usuario_id")
    private Usuario usuario;

	@OneToMany(mappedBy = "apoderado")
	private Collection<Estudiante> estudiantes = new ArrayList<>();

	@OneToMany(mappedBy = "apoderado")
	private Collection<Mensaje> mensajes = new ArrayList<>();
	
	public Apoderado(String nombres, String apellidos, String correo, Integer telefono, String direccion) {
		super();
		this.nombres = nombres;
		this.apellidos = apellidos;
		this.correo = correo;
		this.telefono = telefono;
		this.direccion = direccion;
	}

	public Integer getApoderadoId() {
		return apoderadoId;
	}

	public void setApoderadoId(Integer ApoderadoId) {
		this.apoderadoId = ApoderadoId;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public Integer getTelefono() {
		return telefono;
	}

	public void setTelefono(Integer telefono) {
		this.telefono = telefono;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}