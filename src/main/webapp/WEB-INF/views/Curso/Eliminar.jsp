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
		<form:form method="post" modelAttribute="cursoD">
		
			<div class="row mb-2">
			  <label class="form-control col-1 border-0 font-weight-bold">Código: </label>
			  <form:input type="text" path="cursoId" cssClass="form-control col ml-5" readonly="true" tabindex="-1"/>
			  <div class="col-3"></div>
			</div>			
			
			<div class="row mb-2">
				<label class="form-control col-1 border-0 font-weight-bold">Nombre: </label>
				<form:input type="text" path="nombre" cssClass="form-control col ml-5" readonly="true" tabindex="-1"/>
				<div class="col-1"></div>
			</div>
			<div class="row">
				<c:choose>
					<c:when test="${permitir}">
						<p class="text-primary">¿Estás seguro de que quieres eliminar a este curso?</p>	
					</c:when>
					<c:otherwise>
						<p class="text-primary">No puedes eliminar este curso</p>
					</c:otherwise>
				</c:choose>
				
				
			</div>
			<div class="row mt-3 p-2 justify-content-center">
				<c:if test="${permitir}">
					<button type="submit" class="btn btn-success col mr-5">Sí, eliminar</button>
				</c:if>				
				<button type="button" class="btn btn-danger col" onclick="location.href='/bnnm/cursos/'">Volver</button>
			</div>			
		</form:form>
	</div>
	
	<!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>