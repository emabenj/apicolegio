<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="/bnnm/imgs/logo.png">
	<!-- Styles -  Bootstrap core CSS -->
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
  	<link rel="stylesheet" href="/bnnm/css/style.css">
	
	<title>Edición</title>
</head>
<body>
	<%@ include file="../Templates/UsuarioAEncabezado.jsp" %>
	<div class="row justify-content-center">
		<form:form method="post" modelAttribute="alumnoE">
			<div class="row">
				<div class="col">
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">ID: </label>
						<form:input type="text" path="alumnoId" cssClass="form-control col-2 font-weight-bold" readonly="true" tabindex="-1"/>
						
 						<form:input type="text" id="estadoE" path="estado" cssClass="d-none" required="true"/>
						<label class="form-control col-2 border-0 font-weight-bold text-right">Estado: </label>	
						<div class="btn-group btn-group-toggle col" data-toggle="buttons">
					        <label class="btn btn-secondary optionEditar1">
					            <input type="radio" name="options" id="option1Editar" autocomplete="off" value="ACTIVE">
					            <img src="/bnnm/imgs/active.png" alt="ACTIVE" class="img-fluid icon-link" style="height: 2em" />
					        </label>
					        <label class="btn btn-secondary optionEditar2">
					            <input type="radio" name="options" id="option2Editar" autocomplete="off" value="INACTIVE">
					            <img src="/bnnm/imgs/inactive.png" alt="INACTIVE" class="img-fluid icon-link" style="height: 2em" />
					        </label>
					        <label class="btn btn-secondary optionEditar3">
					            <input type="radio" name="options" id="option3Editar" autocomplete="off" value="BLOCKED">
					            <img src="/bnnm/imgs/blocked.png" alt="BLOCKED" class="img-fluid icon-link" style="height: 2em" />
					        </label>
					    </div>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Código de alumno: </label>
						<form:input type="text" path="alumno_cod" cssClass="form-control col" readonly="true" tabindex="-1"/>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Nombres: </label>
						<form:input type="text" path="nombres" cssClass="form-control col" readonly="true" tabindex="-1"/>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Apellidos:</label>
						<input type="text" value="${alumnoE.apellidoP} ${alumnoE.apellidoM}" class="form-control col" readonly="readonly" tabindex="-1"/>
						<form:input type="hidden" path="apellidoP" cssClass="form-control col" />
						<form:input type="hidden" path="apellidoM" cssClass="form-control col" />
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">DNI: </label>
						<form:input type="number" path="dni" cssClass="form-control col" readonly="true" tabindex="-1"/>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Fecha de nacimiento: </label>
						<form:input type="date" path="fNacimiento" cssClass="form-control col" readonly="true" tabindex="-1"/>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Sexo: </label>
						<form:select path="sexo" cssClass="form-control col" required="true">
							<form:option label="Seleccionar" value=""/>
							<form:option label="Femenino" value="F"/>
							<form:option label="Masculino" value="M"/>
						</form:select>
					</div>
					<div class="row mt-5 p-2">
						<button type="submit" class="btn btn-success col mr-5">Editar</button>
						<button type="button" class="btn btn-danger col" onclick="location.href='/bnnm/alumnos/'">Cancelar</button>
					</div>
				</div>
				<div class="col">
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Nivel educativo: </label>				
						<form:select onchange="cargarGrado(); asignarSeccion();" id="nivelE" path="nEducativo" cssClass="form-control col" required="true">
							<form:option value="" label="Seleccionar"/><form:option value="Primaria"/><form:option value="Secundaria"/>
						</form:select>
					</div>
					<div class="row">
						<label class="form-control col border-0 font-weight-bold text-right" >Grado: </label>
						<form:select onchange="asignarSeccion()" id="grado" path="grado" cssClass="form-control col-4" required="true">
							<form:option value="${alumnoE.grado}" label="${alumnoE.grado}°"></form:option>
						</form:select>
						<input type="hidden" id="gradoT" value="${alumnoE.grado}">
						<label class="form-control col border-0 font-weight-bold text-right">Turno: </label>
						<form:select onchange="asignarSeccion()" id="turno" path="turno" cssClass="form-control col-4" required="true">
							<form:option label="Seleccionar" value=""/>
							<form:option label="Mañana" value="M"/>
							<form:option label="Tarde" value="T"/>
						</form:select>
						<label class="form-control col border-0 font-weight-bold text-right">Sección: </label>
						<form:input type="text" maxlength="1" id="seccion" path="seccion" cssClass="form-control col" readonly="true" required="true"/>
					</div>
					<label class="form-control border-0 font-weight-bold text-center">Cursos: </label>
					<div class="container-fluid h-75">
						<ul id="listaC" class="list-group">
							<c:forEach var="curso" items="${cursosL}">
								<li class="list-group-item list-group-item-success p-1">${curso.nombre}</li>
							</c:forEach>					
						</ul>
					</div>
<!-- 					<div class="d-none"> -->
						<form:select multiple="true" id="CursosParaAlumno" path="itemsCurso" cssClass="form-control col" hidden="true">
							<form:options items="${cursosL}" itemValue="cursoId"/>
						</form:select>
<!-- 					</div> -->
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