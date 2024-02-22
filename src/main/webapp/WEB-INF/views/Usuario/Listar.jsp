<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<link rel="shortcut icon" href="/bnnm/imgs/logo.png">
    <title>Usuarios</title>
    
    <!-- Bootstrap CSS -->
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
  	<link rel="stylesheet" href="/bnnm/css/style.css">
    
</head>
<body>
	<%@ include file="../Templates/UsuarioAEncabezado.jsp" %>
    <div class="container-fluid">
        <h1>ALUMNOS:</h1>
		
        <h2>TODOS LOS USUARIOS</h2>
        <c:if test="${not empty usuariosL}">
            <table class="table table-dark table-bordered">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Usuario</th>
                        <th scope="col">Nombres</th>
                        <th scope="col">Apellidos</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Roles</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${usuariosL}" var="user">
                   		<tr>
                        	<th scope="row">${user.userId}</th>
                        	<td>${user.user}</td>
                            <td>${user.nombres}</td>
                            <td>${user.apellidos}</td>
                            <td id="estado">${user.estado}</td>
                            <td>${user.itemsRole.size()}</td>
                            <td>
							<div class="container-fluid">
								<a class="ml" href="/bnnm/usuarios/editar/${user.userId}">
								    <img src="/bnnm/imgs/editar-u.png" alt="Editar usuario" class="img-fluid icon-link" style="height: 2em"/>
								</a> | 
								<a onclick="cambiarEstado(this, ${user.userId})" class="ml" href="#">
								    <img src="/bnnm/imgs/active.png" alt="ACTIVE" class="img-fluid icon-link" style="height: 2em"/>
								</a>
								<a onclick="cambiarEstado(this, ${user.userId})" class="ml" href="#">
								    <img src="/bnnm/imgs/inactive.png" alt="INACTIVE" class="img-fluid icon-link" style="height: 2em"/>
								</a>
								<a onclick="cambiarEstado(this, ${user.userId})" class="ml" href="#">
								    <img src="/bnnm/imgs/blocked.png" alt="BLOCKED" class="img-fluid icon-link" style="height: 2em"/>
								</a>
								<a onclick="cambiarEstado(this, ${user.userId})" class="ml" href="#">
								    <img src="/bnnm/imgs/deleted.png" alt="DELETED-${user.userId}" class="img-fluid icon-link" style="height: 2em"/>
								</a>
							</div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
    <div class="modal fade" id="modalConfirmacion" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Confirmar</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	          <p>¿Estás seguro de eliminar la cuenta de este usuario?</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="cerrarModal" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
	        <button id="btnConfirmarU" type="button" class="btn btn-danger">Sí, eliminar</button>
	      </div>
	    </div>
	  </div>
	</div>
	
    <div class="modal fade" id="modalMostrarDels" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Ingresar contraseña</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<form>
				<div class="form-group">
					<label for="confirmarPass" class="col-form-label">Contraseña:</label>
					<input type="password" class="form-control" id="confirmarPass">
				</div>
	        </form>        
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="cerrarModal" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
	        <button id="btnConfirmarPass" type="button" class="btn btn-primary">Ingresar</button>
	      </div>
	    </div>
	  </div>
	</div>
    
    <!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"></script>
	
	<script src="/bnnm/js/scriptUsuario.js" type="text/javascript"></script>
</body>
</html>
