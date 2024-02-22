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
		<form:form method="post" modelAttribute="alumnoR">
			<div class="row h-75">
				<div class="col">
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Código de alumno: </label>
						<form:input type="text" path="alumno_cod" id="codigo" cssClass="form-control col" readonly="true" tabindex="-1"/>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Nombres: </label>
						<form:input onchange="generarCodigo()" type="text" path="nombres" id="nombres" cssClass="form-control col" required="true"/>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Apellido Paterno: </label>
						<form:input onchange="generarCodigo()" type="text" path="apellidoP" id="apeP" cssClass="form-control col" required="true"/>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Apellido Materno: </label>
						<form:input onchange="generarCodigo()" type="text" path="apellidoM" id="apeM" cssClass="form-control col" required="true"/>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">DNI: </label>
						<form:input onchange="generarCodigo()" min="10000000" max="99999999" type="number" path="dni" id="dni" cssClass="form-control col" required="true"/>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Fecha de nacimiento: </label>
						<form:input type="date" path="fNacimiento" cssClass="form-control col" required="true"/>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Sexo: </label>
						<form:select path="sexo" cssClass="form-control col">
							<form:option label="Seleccionar" value=""/>
							<form:option label="Femenino" value="F"/>
							<form:option label="Masculino" value="M"/>
						</form:select>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Nivel educativo: </label>
						<form:select onchange="cargarGrado(); asignarSeccion();" id="nivelE" path="nEducativo" cssClass="form-control col-6" required="true">
							<form:option value="" label="Seleccionar"/><form:option value="Primaria"/><form:option value="Secundaria"/>
						</form:select>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right" >Grado: </label>
						<form:select onchange="asignarSeccion()" id="grado" path="grado" cssClass="form-control col" required="true">
							<form:option label="" value=""/>
						</form:select>

						<label class="form-control col border-0 font-weight-bold text-right">Turno: </label>
						<form:select onchange="asignarSeccion()" id="turno" path="turno" cssClass="form-control col" required="true">
							<form:option label="" value=""/>
							<form:option label="Mañana" value="M"/>
							<form:option label="Tarde" value="T"/>
						</form:select>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Sección: </label>
						<form:input type="text" maxlength="1" id="seccion" path="seccion" cssClass="form-control col" readonly="true" required="true"/>
					</div>					
				</div>
				<div class="col mb-2">
					<label class="form-control col border-0 font-weight-bold text-center">Cursos: </label>
					<div class="container-fluid h-75"><ul class="list-group" id=listaC></ul></div>
					<div class="row mt-2 p-2">
						<button type="submit" class="btn btn-success col mr-5">Guardar</button>
						<button type="button" class="btn btn-danger col" onclick="location.href='/bnnm/alumnos/'">Cancelar</button>
					</div>
					<div class="d-none"><form:select multiple="true" id="CursosParaAlumno" path="itemsCurso" cssClass="form-control col"></form:select></div>
					
				</div>
			</div>			
		</form:form>
	</div>
	
	<!-- Bootstrap core JavaScript -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"></script>
	
	<script src="/bnnm/js/script01.js" type="text/javascript"></script>
	<script src="/bnnm/js/scriptAlumno.js" type="text/javascript"></script>
	
</body>
</html>