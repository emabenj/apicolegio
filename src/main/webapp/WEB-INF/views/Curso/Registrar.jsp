<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="/bnnm/imgs/logo.png">
	<!-- Styles -  Bootstrap core CSS -->
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
  	<link rel="stylesheet" href="/bnnm/css/style.css">
   	
	<title>Nuevo Curso</title>	
</head>
<body>
	<%@ include file="../Templates/UsuarioAEncabezado.jsp" %>
	<div class="row justify-content-center mt-5">
		<form:form method="post" modelAttribute="cursoR">
			<div class="row mb-2">
				<label class="form-control col border-0 font-weight-bold text-right">Nombre: </label>
				<form:input type="text" path="nombre" cssClass="form-control col" />
			</div>
			<div class="row mb-2">
				<label class="form-control col border-0 font-weight-bold text-right">Nivel educativo: </label>				
				<form:select path="niv_educativo" cssClass="form-control col" required="true">
					<form:option value="" label="Seleccionar"/><form:option value="Primaria"/><form:option value="Secundaria"/>
				</form:select>
			</div>
			<div class="row mb-2">
				<label class="form-control col border-0 font-weight-bold text-right">Turno: </label>
				<form:select path="turno" cssClass="form-control col" required="true">
					<form:option label="Seleccionar" value=""/>
					<form:option label="Mañana" value="M"/>
					<form:option label="Tarde" value="T"/>
				</form:select>
			</div>
			<div class="row mb-2">
				<label class="form-control col border-0 font-weight-bold text-right">Día: </label>
				<form:select path="dia" cssClass="form-control col" required="true">
					<form:option label="Seleccionar" value=""/>
					<form:option value="Lunes"/>
					<form:option value="Martes"/>
					<form:option value="Miércoles"/>
					<form:option value="Jueves"/>
					<form:option value="Viernes"/>
				</form:select>
			</div>
			
			<div class="row mt-3 p-2">
				<button type="submit" class="btn btn-success col mr-5">Guardar</button>
				<button type="button" class="btn btn-danger col" onclick="location.href='/bnnm/cursos/'">Cancelar</button>
			</div>
			
		</form:form>
	</div>
	
	<!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	
</body>
</html>