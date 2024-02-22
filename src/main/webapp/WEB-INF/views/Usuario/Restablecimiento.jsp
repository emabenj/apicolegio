<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="shortcut icon" href="/bnnm/imgs/logo.png">
	<title>Restablecimiento de contraseña</title>
	
    <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a href="/idat/usuario/iniciar-sesion" class="navbar-brand"> 
				<i class="bi bi-globe"></i>
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent2" aria-controls="navbarSupportedContent2" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent2">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item dropdown">
						<a href="/bnnm/login" class="nav-link" role="button"> Iniciar Sesión </a>
					</li>
<!-- 					<li class="nav-item dropdown"> -->
<!-- 						<a href="/idat/usuario/registrar" class="nav-link" role="button"> Registrarse </a> -->
<!-- 					</li> -->
				</ul>
			</div>
		</div>
	</nav>
	<div class="container-fluid">
		<div>
			<div id="alertaCorreoU" class="alert alert-warning mt-2" role="alert" >
				El correo es inválido o no existe. Inténtelo de nuevo.
			</div>
			<div id="alertaContrasU" class="alert alert-warning mt-2" role="alert">
				Las contraseñas deben ser las mismas.
			</div>
		</div>
		<div class="justify-content-center align-items-center">			
			<form class="col-5 m-3">				
				<div class="row mb-2">					
					<label class="form-control col border-0 font-weight-bold">Correo</label>
<%-- 					<c:if test="${correo == null}"> --%>
<%-- 						<c:set var="correo" value=""></c:set>						 --%>
<%-- 					</c:if> --%>
					<input type="email" id="correo" class="form-control col" value="${correo}"/>					
				</div>				
				<div class="row mb-2">
				  <label class="form-control col border-0 font-weight-bold">Nueva Contraseña</label>
				  <input type="password" name="newPass" class="form-control col"/>
				</div>
				<div class="row mb-2">
				  <label class="form-control col border-0 font-weight-bold">Confirmar Nueva Contraseña</label>
				  <input  type="password" name="newPass" class="form-control col"/>
				</div>				
			</form>
		</div>
		<div class="row mt-3 p-2">
			<button id="btnRestablecerU" class="btn btn-secondary col mr-5" disabled>Restablecer</button>
			<button type="button" class="btn btn-danger col" onclick="location.href='./login'">Cancelar</button>
		</div>
	</div>
		
	<!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"></script>
	
	<script src="/bnnm/js/scriptUsuario.js" type="text/javascript"></script>
</body>
</html>