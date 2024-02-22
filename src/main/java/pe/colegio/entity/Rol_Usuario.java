package pe.colegio.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

import pe.colegio.util.RoleType;

@Entity @Table(name="roles")
public class Rol_Usuario implements Serializable {
	private static final long serialVersionUID=1L;

	public Rol_Usuario() { }
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer roleId;
	
	@Column(unique = true, nullable = false)
	private String nombre = RoleType.APOD.name();
	
	@ManyToMany(mappedBy = "itemsRole", fetch = FetchType.EAGER)
	private Set<Usuario> itemsUser=new HashSet<>();

	public Rol_Usuario(String nombre) {
		super();
		this.nombre = nombre;
	}


	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Set<Usuario> getItemsUser() {
		return itemsUser;
	}

	public void setItemsUser(Set<Usuario> itemsUser) {
		this.itemsUser = itemsUser;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}	
}