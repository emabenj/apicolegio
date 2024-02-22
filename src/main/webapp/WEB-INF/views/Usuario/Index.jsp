<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="/bnnm/imgs/logo.png">
	<title>Bienvenido...</title>
	
	<!-- Bootstrap core CSS -->
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">   	
</head>
<body>
	<%@ include file="../Templates/UsuarioAEncabezado.jsp" %>
	
	<div class="container-fluid">
		<c:choose>
			<c:when test="${usuario == 'Administrador'}">
				<div class="row mb-3">
					<a href="/bnnm/docentes/" class="col text-center">
						<span class="text-capitalize font-weight-bold text-center p-3">docentes</span><br>			
						<img src="/bnnm/imgs/docente.png" alt="LOGO DOCENTE" class="img-fluid w-25" >
					</a>
					<a href="/bnnm/alumnos/" class="col text-center">
						<span class="text-capitalize font-weight-bold text-center p-3">alumnos</span><br>
						<img src="/bnnm/imgs/alumno.png" alt="LOGO ALUMNO" class="img-fluid w-25" >
					</a>	
				</div>		
				<div class="row">
					<div class="col"></div>
					<a href="/bnnm/cursos/" class="col-6 text-center">
						<span class="text-capitalize font-weight-bold text-center p-3">cursos</span><br>
						<img src="/bnnm/imgs/cursos.png" alt="LOGO CURSOS" class="img-fluid w-25">
					</a>
					<div class="col"></div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row mb-3">				
					<a href="/bnnm/docente/editar-perfil" class="col text-center">
						<span class="text-capitalize font-weight-bold text-center p-3">Editar Perfil</span><br>			
						<img src="/bnnm/imgs/editar.png" alt="LOGO DOCENTE" class="img-fluid w-50" >
					</a>
					<a href="/bnnm/notas/" class="col text-center">
						<span class="text-capitalize font-weight-bold text-center p-3">Notas Alumnos</span><br>
						<img src="/bnnm/imgs/alumno.png" alt="LOGO ALUMNO" class="img-fluid w-50">
					</a>
					<a href="/bnnm/asistencias/" class="col text-center">
						<span class="text-capitalize font-weight-bold text-center p-3">Asistencias Alumnos</span><br>
						<img src="/bnnm/imgs/alumno.png" alt="LOGO ALUMNO" class="img-fluid w-50">
					</a>
				</div>				
			</c:otherwise>			
		</c:choose>
    </div>
    
	<!-- Bootstrap core JavaScript -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<script src="/bnnm/js/scriptEncabezado.js" type="text/javascript"></script>
</body>
</html>