<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<link rel="shortcut icon" href="../imgs/logo.png">
    <title>Alumnos</title>
    
    <!-- Bootstrap CSS -->
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
    
</head>
<body>
	<%@ include file="../Templates/UsuarioAEncabezado.jsp" %>
    <div class="container-fluid">
        <h1>ALUMNOS:</h1>
		
        <h2>TODOS LOS ALUMNOS</h2>
        <c:if test="${not empty alumnosL}">
            <table class="table table-dark table-bordered">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Alumno</th>
                        <th scope="col">Grado</th>
                        <th scope="col">Sección</th>
                        <th scope="col">Turno</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${alumnosL}" var="alumno">
                        <tr>
                        	<th scope="row">${alumno.alumnoId}</th>
                            <td>${alumno.nombres} ${alumno.apellidoP} ${alumno.apellidoM}</td>
                            <td>${alumno.grado}</td>
                            <td>${alumno.seccion}</td>
                            <td>${alumno.turno}</td>                       
                            <td>
                            	<a href="/bnnm/asistencias/alumno/${alumno.alumnoId}/1" class="text-info">Controlar asistencias</a>
                            </td>                          
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>    
    
    <!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"></script>	
</body>
</html>
