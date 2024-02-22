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
   	
	<title>Nuevo Docente</title>	
</head>
<body>
	<%@ include file="../Templates/UsuarioAEncabezado.jsp" %>
	<div class="row justify-content-center">
		<form:form method="post" modelAttribute="docenteR">
			<div class="row h-75">
				<div class="col">
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Código : </label>
						<form:input type="text" path="docente_cod" id="codigo" cssClass="form-control col" readonly="true" tabindex="-1"/>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Nombres:</label>
						<form:input type="text" path="nombres" id="nombres" cssClass="form-control col" required="true"/>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Apellido Paterno: </label>
						<form:input type="text" path="apellidoP" id="apeP" cssClass="form-control col" required="true"/>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Apellido Materno: </label>
						<form:input type="text" path="apellidoM" id="apeM" cssClass="form-control col" required="true"/>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">DNI: </label>
						<form:input min="10000000" max="99999999" type="number" path="dni" id="dni" cssClass="form-control col" required="true"/>
					</div>
					<div class="row">
						<label class="form-control col border-0 font-weight-bold text-right">Sexo: </label>
						<form:select path="sexo" cssClass="form-control col" required="true">
							<form:option label="Seleccionar" value=""/>
							<form:option label="Femenino" value="F"/>
							<form:option label="Masculino" value="M"/>
						</form:select>
					</div>
					<div class="row mb-2">
						<label class="form-control border-0 font-weight-bold text-center">E-mail: </label>
						<div class="col"></div>
						<form:input type="email" path="correo" cssClass="form-control w-75" required="true"/>						
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Dirección: </label>
						<form:input type="text" path="direccion" cssClass="form-control col" required="true"/>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Teléfono: </label>
						<form:input type="number" path="celular" min="900000000" max="999999999" cssClass="form-control col" required="true"/>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Fecha de Registro: </label>
						<form:input type="date" path="fRegistro" id="fecha" cssClass="form-control col" readonly="true"/>
					</div>					
				</div>
				<div class="col ml-4">
					<div class="row">
						<label class="form-control border-0 font-weight-bold text-center">Seleccionar: </label>
					</div>
					<div class="row">
						<div class="col"></div>
						<div class="col row">
						    <div class="form-check col">
							    <input class="form-check-input" name="rbtnNE" type="radio" id="rb1M" value="Primaria">
							    <label class="form-check-label" for="rb1M">Primaria</label>
							</div>
							<div class="form-check col">
							    <input class="form-check-input" name="rbtnNE" type="radio" id="rb2M" value="Secundaria">
							    <label class="form-check-label" for="rb2M">Secundaria</label>
							</div>
						</div>
						<div class="col row">
						    <div class="form-check col">
							    <input class="form-check-input" name="rbtnT" type="radio" id="rbTMM" value="M">
							    <label class="form-check-label" for="rbTMM">Mañana</label>
							</div>
							<div class="form-check col">
							    <input class="form-check-input" name="rbtnT" type="radio" id="rbTTM" value="T">
							    <label class="form-check-label" for="rbTTM">Tarde</label>
							</div>
						</div><div class="col"></div>
					</div>
					<div class="row">
						<label class="form-control border-0 font-weight-bold text-center">Curso: </label>						
						<form:select path="curso.cursoId" cssClass="form-control col w-75" id="cursosM" required="true">
							<option label="Seleccionar" value=""/>
						</form:select>
					</div>
					<div class="row mt-2 p-2">
						<button type="submit" class="btn btn-success col mr-5">Guardar</button>
						<button type="button" class="btn btn-danger col" onclick="location.href='/bnnm/docentes/'">Cancelar</button>
					</div>
				</div>					
			</div>
		</form:form>
	</div>
	
	<!-- Bootstrap core JavaScript -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"></script>
	
	<script src="/bnnm/js/script01.js" type="text/javascript"></script>
	<script src="/bnnm/js/scriptDocente.js" type="text/javascript"></script>
	<script>
	    document.getElementById("fecha").value = new Date().toISOString().slice(0, 10);
	</script>	
	
</body>
</html>