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
<%--         <h2>Seccion: ${ } - Grado: ${ } - Turno: ${ } - Curso ${ }</h2> --%>
        <c:if test="${not empty alumnosL}">
            <table class="table table-dark table-bordered">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Alumno</th>
                        <th scope="col">Promedio</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                	<c:set var="promAl" value="0"></c:set>
                    <c:forEach items="${alumnosL}" var="alumno">
                        <tr>
                        	<th scope="row">${alumno.alumnoId}</th>
                            <td>${alumno.nombres} ${alumno.apellidoP} ${alumno.apellidoM}</td>
                            
                            <c:set var="promF" value="0.0"></c:set>
                            <c:forEach items="${alumno.notas}" var="nota">
                            	<c:if test="${nota.curso.cursoId.equals(cid) and nota.notaFinal > 0}">
                            		<c:set var="promF" value="${nota.notaFinal}"></c:set>
                            	</c:if>                            	
                            </c:forEach>
                            <c:choose>
                            	<c:when test="${promF != 0.0}">
                            		<c:set var="promAl" value="${promF+promAl}"></c:set>
                            		<td>${promF}</td>
                            	</c:when>
                            	<c:otherwise>
                            		<td>--</td>	                        		    	
	                            </c:otherwise>	
                            </c:choose>
                            <td>
                            	<a href="/bnnm/notas/alumno/${alumno.alumnoId}" class="text-success">
                            		<img src="/bnnm/imgs/manejar-notas.png" alt="Manejar notas" class="img-fluid icon-link" style="height: 2em"/>
								</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                    	<c:set var="promAL" value="${promAl/alumnosL.size()}"></c:set>
                    	<td></td><th>Promedio de alumnos</th><td>${promAL}</td>
                    </tr>
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