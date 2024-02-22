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
	<title>Asistencia</title>
</head>
<body>
	<%@ include file="../Templates/UsuarioAEncabezado.jsp" %>
	<h3>Asistencias del ${dia1} al ${dia5} de ${mes}</h3>
	<div class="justify-content-center">		
		<c:forEach begin="0" end="${ctnA-1}" varStatus="ctnd">		
			<form:form method="post" modelAttribute="mdlAsistencia${ctnd.count}">
				<div class="d-none"><form:input type="number" path="asistenciaId"/></div>
				
				<div class="row mb-2">
					<label class="form-control col border-0 font-weight-bold text-right">Fecha: </label>
					<form:input type="text" id="fecha_${ctnd.count}" path="fecha" cssClass="form-control col" readonly="true"/>
				</div>
				<div class="row mb-2">
					<label class="form-control col border-0 font-weight-bold text-right">Estado: </label>
					<form:select  path="estado">
						<form:option value="Asistencia"/>
						<form:option value="Tardanza"/>
						<form:option value="Falta" />
					</form:select>
					<div class="col row" id="rbtns">
					    <div class="form-check">
						    <input onclick="mostrarDJ('${ctnd.count}')" class="form-check-input" id="rb1_${ctnd.count}" name="rbtnAsist_${ctnd.count}" type="radio" value="Asistencia">
						    <label class="form-check-label" for="rb1_${ctnd.count}">Asistencia</label>
						</div>
						<div class="form-check">
						    <input onclick="mostrarDJ('${ctnd.count}')" class="form-check-input" id="rb2_${ctnd.count}" name="rbtnAsist_${ctnd.count}" type="radio" value="Tardanza">
						    <label class="form-check-label" for="rb2_${ctnd.count}">Tardanza</label>
						</div>
						<div class="form-check">
						    <input onclick="mostrarDJ('${ctnd.count}')" class="form-check-input" id="rb3_${ctnd.count}" name="rbtnAsist_${ctnd.count}" type="radio" value="Falta">
						    <label class="form-check-label" for="rb3_${ctnd.count}">Falta</label>
						</div>
					</div>
					<div class="d-none"><form:input type="text" id="estado_${ctnd.count}" path="estado" cssClass="form-control col"/></div>					
				</div>
				<div class="row d-none" id="divJust_${ctnd.count}">					
					<label class="form-control col border-0 font-weight-bold text-right">Justificación: </label>
					<form:textarea type="text" id="justificacion_${ctnd.count}" path="justificacion" cssClass="form-control col"/>					
				</div>								
			</form:form>					    
		</c:forEach>
		<div class="row mt-3 p-2">
			<button type="submit" class="btn btn-success col mr-5" onclick="guardarFormularios()">Guardar todos</button>
			<button type="button" class="btn btn-danger col" onclick="location.href='/bnnm/asistencias/'">Cancelar</button>
		</div>
	</div>
	
	<!-- Bootstrap core JavaScript -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"></script>
	
	<script src="/bnnm/js/scriptAsistencias.js" type="text/javascript"></script>	
</body>
</html>