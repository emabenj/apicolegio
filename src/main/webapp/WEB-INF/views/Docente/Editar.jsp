<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<form:form method="post" modelAttribute="docenteE">
			<div class="row h-75">
				<div class="col">
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Código: </label>
						<form:input type="text" path="docente_cod" cssClass="form-control col" readonly="true" tabindex="-1"/>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Nombres:</label>
						<form:input type="text" path="nombres" cssClass="form-control col" readonly="true" tabindex="-1"/>
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">Apellidos:</label>
						<input type="text" value="${docenteE.apellidoP} ${docenteE.apellidoM}" class="form-control col" readonly="readonly" tabindex="-1"/>
						<form:input type="hidden" path="apellidoP" cssClass="form-control col" />
						<form:input type="hidden" path="apellidoM" cssClass="form-control col" />
					</div>
					<div class="row mb-2">
						<label class="form-control col border-0 font-weight-bold text-right">DNI: </label>
						<form:input type="number" path="dni" cssClass="form-control col" readonly="true" tabindex="-1"/>
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
						<form:input type="date" path="fRegistro" cssClass="form-control col" readonly="true"/>
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
							    <c:choose>
							    	<c:when test="${neEdit == 'Primaria'}">
							    		<input checked class="form-check-input" name="rbtnNE" type="radio" id="rb1M" value="Primaria">
							    	</c:when>
							    	<c:otherwise><input class="form-check-input" name="rbtnNE" type="radio" id="rb1M" value="Primaria"></c:otherwise>
							    </c:choose>
							    <label class="form-check-label" for="rb1M">Primaria</label>
							</div>
							<div class="form-check col">
								<c:choose>
							    	<c:when test="${neEdit == 'Secundaria'}">
							    		<input checked class="form-check-input" name="rbtnNE" type="radio" id="rb2M" value="Secundaria">
							    	</c:when>
						    		<c:otherwise><input class="form-check-input" name="rbtnNE" type="radio" id="rb2M" value="Secundaria"></c:otherwise>							    	
							    </c:choose>							    
							    <label class="form-check-label" for="rb2M">Secundaria</label>
							</div>
						</div>
						<div class="col row">
						    <div class="form-check col">
						    	<c:choose>
						    		<c:when test="${tnEdit == 'M'}">
						    			<input checked class="form-check-input" name="rbtnT" type="radio" id="rbTMM" value="M">		
						    		</c:when>
						    		<c:otherwise><input class="form-check-input" name="rbtnT" type="radio" id="rbTMM" value="M"></c:otherwise>
						    	</c:choose>							    
							    <label class="form-check-label" for="rbTMM">Mañana</label>
							</div>
							<div class="form-check col">
								<c:choose>
						    		<c:when test="${tnEdit == 'T'}">
						    			<input checked class="form-check-input" name="rbtnT" type="radio" id="rbTTM" value="T">
						    		</c:when>
						    		<c:otherwise><input class="form-check-input" name="rbtnT" type="radio" id="rbTTM" value="T"></c:otherwise>
						    	</c:choose>							    
							    <label class="form-check-label" for="rbTTM">Tarde</label>
							</div>
						</div><div class="col"></div>
					</div>
					<div class="row">
						<label class="form-control border-0 font-weight-bold text-center">Curso: </label>						
						<form:select path="curso.cursoId" cssClass="form-control col w-75" id="cursosM" required="true">
							<option label="${docenteE.curso.nombre}" value="${docenteE.curso.cursoId}"/>
						</form:select>
					</div>
					<div class="row">
						<form:input type="text" id="estadoE" path="estado" cssClass="d-none" required="true"/>
						<label class="form-control border-0 font-weight-bold text-center">Estado: </label>	
						<div class="btn-group btn-group-toggle col" data-toggle="buttons">
					        <label class="btn btn-secondary optionEditar1">
					            <input type="radio" name="options" id="option1Editar" autocomplete="off" value="ACTIVE">
					            <img src="/bnnm/imgs/active.png" alt="ACTIVE" class="img-fluid icon-link" style="height: 2em" />
					        </label>
					        <label class="btn btn-secondary optionEditar2">
					            <input type="radio" name="options" id="option2Editar" autocomplete="off" value="INACTIVE">
					            <img src="/bnnm/imgs/inactive.png" alt="INACTIVE" class="img-fluid icon-link" style="height: 2em" />
					        </label>
<!-- 					        <label class="btn btn-secondary optionEditar3"> -->
<!-- 					            <input type="radio" name="options" id="option3Editar" autocomplete="off" value="BLOCKED"> -->
<!-- 					            <img src="/bnnm/imgs/blocked.png" alt="BLOCKED" class="img-fluid icon-link" style="height: 2em" /> -->
<!-- 					        </label> -->
					    </div>
					</div>
					<div class="row mt-2 p-2">
						<button type="submit" class="btn btn-success col mr-5">Editar</button>
						<button type="button" class="btn btn-danger col" onclick="location.href='/bnnm/docentes/'">Cancelar</button>				
					</div>
				</div>			
			</div>	
		</form:form>
	</div>
	
	<!-- Bootstrap core JavaScript -->
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"></script>
	
	<script src="/bnnm/js/script01.js" type="text/javascript"></script>
	<script src="/bnnm/js/scriptDocente.js" type="text/javascript"></script>
</body>
</html>