<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<link rel="shortcut icon" href="../imgs/logo.png">
	
    <title>Edición</title>
    
    <!-- Bootstrap CSS -->
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="../Templates/UsuarioAEncabezado.jsp" %>
	<div class="container-fluid">
		<div class="row justify-content-center align-items-center bg-light">
			<form:form cssClass="m-3" method="post" modelAttribute="usuarioE">
				<c:if test="${param.exito != null}">
					<div class="alert alert-primary mt-2" role="alert">
					  Se ha actualizado la información correctamente.
					</div>
				</c:if>
				<div class="row mb-2 d-none"><form:input type="text" path="userId" cssClass="form-control col"/></div>
				<div class="row mb-2 ">
					<label class="form-control bg-light col p-2 border-0 font-weight-bold text-right">Usuario: </label>
					<form:input type="text" path="user" cssClass="form-control col" readonly="true"/>
				</div>
				
				<div class="row mb-2 ">
					<label class="form-control bg-light col p-2 border-0 font-weight-bold text-right">Nombres: </label>
					<form:input type="text" path="nombres" cssClass="form-control col" readonly="true"/>
				</div>
				<div class="row mb-2 ">
					<label class="form-control bg-light col p-2 border-0 font-weight-bold text-right">Apellidos: </label>
					<form:input type="text" path="apellidos" cssClass="form-control col" readonly="true"/>
				</div>
				<div class="row mb-2">
					<label class="form-control bg-light col border-0 font-weight-bold text-right">Sexo: </label>
					<form:select path="sexo" cssClass="form-control col" required="true">
						<form:option label="Seleccionar" value=""/>
						<form:option label="Femenino" value="F"/>
						<form:option label="Masculino" value="M"/>
					</form:select>
				</div>
				<div class="row mb-2 ">
					<label class="form-control bg-light col p-2 border-0 font-weight-bold text-right">Correo: </label>
					<form:input type="email" path="email" cssClass="form-control col" required="true"/>
				</div>
				<div class="row mb-2 ">
					<label class="form-control bg-light col p-2 border-0 font-weight-bold text-right">Teléfono: </label>
					<form:input type="number" path="celular" min="900000000" max="999999999" cssClass="form-control col" required="true"/>
				</div>
				<div class="row mt-3 p-2">
					<button type="submit" class="btn btn-info col mr-5">Editar</button>
					<button type="button" class="btn btn-danger col" onclick="location.href='.'">Cancelar</button>
				</div>
			</form:form>
		</div>	
	</div>		
	
	<!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>