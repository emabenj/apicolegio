<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="/bnnm/imgs/logo.png">
	<title>Inicio de Sesión</title>
	
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
						<a href="/bnnm/home" class="nav-link" role="button">Inicio</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row justify-content-center align-items-center bg-light">
			<form class="m-3" method="post" action="/bnnm/login">
				<!-- token de seguridad -->
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				
				<c:if test="${param.error != null}">
					<div class="alert alert-danger mt-2" role="alert">
					  Usuario o Contraseña inválidos.
					</div>
				</c:if>				
				<c:if test="${param.logout != null}">					
					<div class="alert alert-info mt-2" role="alert">
					  Cierre de sesión exitoso.
					</div>
				</c:if>
				<div class="row mb-2 ">
					<label class="form-control bg-light col p-2 border-0 font-weight-bold text-right">Usuario:</label>
					<input type="text" name="usuario" class="form-control col"/>
				</div>
				<div class="row mb-2">
					<label class="form-control bg-light col p-2 border-0 font-weight-bold text-right">Contraseña:</label>
					<input type="password" name="contrasena" class="form-control col" />
				</div>
				<div class="row mt-3 p-2">
					<button type="submit" class="btn btn-success col">Iniciar Sesión</button>
					<button type="button" class="btn ml-5 btn-danger col" onclick="location.href='../welcome'">Cancelar</button> 
				</div>
				<div class="row mt-3 p-2">
					<div class="col"></div>
					<div class="col-3">
						<a href="/bnnm/restablecer-cuenta">Restablecer Contraseña</a>
					</div>
					<div class="col"></div>
				</div>	
			</form>
		</div>
	</div>	
</body>
</html>