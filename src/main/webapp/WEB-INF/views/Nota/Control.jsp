<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="/bnnm/imgs/logo.png">
	<!-- Styles -  Bootstrap core CSS -->
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
  	<link rel="stylesheet" href="/bnnm/css/style.css">
	<title>Nuevo Alumno</title>
</head>
<body>
	<%@ include file="../Templates/UsuarioAEncabezado.jsp" %>
	<div class="row justify-content-center">
		<form:form method="post" modelAttribute="notasM">
			<div class="d-none">
				<form:input path="notaId"/>
			</div>
			<div class="row mb-2">
				<label class="form-control col border-0 font-weight-bold text-right">Nota 1: </label>
				<form:input onchange="calcularNF()" min="0" max="20" type="number" id="n1" path="nota1" cssClass="form-control col"/>
			</div>
			<div class="row mb-2">
				<label class="form-control col border-0 font-weight-bold text-right">Nota 2: </label>
				<form:input onchange="calcularNF()" min="0" max="20" type="number" id="n2" path="nota2" cssClass="form-control col"/>
			</div>
			<div class="row mb-2">
				<label class="form-control col border-0 font-weight-bold text-right">Nota 3: </label>
				<form:input onchange="calcularNF()" min="0" max="20" type="number" id="n3" path="nota3" cssClass="form-control col"/>
			</div>
			<div class="row mb-2">
				<label class="form-control col border-0 font-weight-bold text-right">Nota 4: </label>
				<form:input onchange="calcularNF()" min="0" max="20" type="number" id="n4" path="nota4" cssClass="form-control col"/>
			</div>
			<div class="row mb-2">
				<label class="form-control col border-0 font-weight-bold text-right">Nota Final: </label>
				<form:input min="0" max="20" step="0.01" type="number" id="n5" path="notaFinal" cssClass="form-control col" readonly="true"/>
			</div>
			
			<div class="row mt-3 p-2">
				<button type="submit" class="btn btn-success col mr-5">Guardar</button>
				<button type="button" class="btn btn-danger col" onclick="location.href='/bnnm/notas/'">Cancelar</button>
			</div>
			<form:input type="number" path="curso.cursoId" hidden="true"/>
			<form:input type="number" path="alumno.alumnoId" hidden="true"/>
		</form:form>
	</div>
	
	<!-- Bootstrap core JavaScript -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"></script>
	
	<script src="/bnnm/js/scriptNotas.js" type="text/javascript"></script>
	
</body>
</html>