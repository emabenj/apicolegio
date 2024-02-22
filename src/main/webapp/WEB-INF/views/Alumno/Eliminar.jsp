<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="/bnnm/imgs/logo.png">
	<!-- Styles -  Bootstrap core CSS -->
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
  	<link rel="stylesheet" href="/bnnm/css/style.css">
	
	<title>Eliminación</title>
</head>
<body>
	<%@ include file="../Templates/UsuarioAEncabezado.jsp" %>
	<div class="row justify-content-center">
		<form:form method="post" modelAttribute="alumnoD">		
			<div class="row mb-2">
			  <label class="form-control col-1 border-0 font-weight-bold">Código: </label>
			  <form:input type="text" path="alumno_cod" cssClass="form-control col ml-5" readonly="true" tabindex="-1"/>
			  <div class="col-3"></div>
			</div>			
			
			<div class="row mb-2">
				<label class="form-control col-1 border-0 font-weight-bold">Alumno: </label>
				<input type="text" value="${alumnoD.nombres} ${alumnoD.apellidoP} ${alumnoD.apellidoM}" class="form-control col ml-5 p-2" readonly="readonly" tabindex="-1"/>
				<div class="col-1"></div>
			</div>
			<div class="row">
				<p class="text-primary">¿Estás seguro de que quieres eliminar a este alumno?</p>
			</div>
			<div class="row mt-3 p-2 justify-content-center">
				<button type="submit" class="btn btn-success col mr-5">Sí, eliminar</button>
				<button type="button" class="btn btn-danger col" onclick="location.href='/bnnm/alumnos/'">Cancelar</button>
			</div>			
		</form:form>
	</div>
	
	<!-- Bootstrap core JavaScript -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>