<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<link rel="shortcut icon" href="../imgs/logo.png">
    <title>Cursos</title>
    
    <!-- Bootstrap CSS -->
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
    
</head>
<body>
	<%@ include file="../Templates/UsuarioAEncabezado.jsp" %>
    <div class="container-fluid">
        <h1>CURSOS:</h1>		
        <h2>TODOS LOS CURSOS</h2>
        <c:if test="${not empty cursosL}">
            <table class="table table-dark table-bordered">
                <thead>
                    <tr>
                        <th class="text-center" scope="col">ID</th>
                        <th class="text-center" scope="col">Nombre</th>
                        <th class="text-center" scope="col">Nivel Educativo</th>
                        <th class="text-center" scope="col">Turno</th>
                        <th class="text-center" scope="col">Día</th>
                        <th class="text-center" scope="col">Docentes</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${cursosL}" var="curso">
                        <tr>
                            <th class="text-center">${curso.cursoId}</th>
                            <td>${curso.nombre}</td>
                            <td class="text-center">${curso.niv_educativo} ${docente.apellidoM}</td>
                            <td class="text-center">${curso.turno}</td>
                            <td class="text-center">${curso.dia}</td>
                            <td>
                            	<ol>
                            		<c:forEach var="docente" items="${curso.docentes}">
                            			<li class="text-light" >${docente.nombres} ${docente.apellidoP} ${docente.apellidoM}</li>
			                        </c:forEach>
                            	</ol>								
							</td>
                            <td>
                            	<a href="/bnnm/cursos/editar/${curso.cursoId}" class="text-success">Editar</a> | 
                            	<a href="/bnnm/cursos/eliminar/${curso.cursoId}" class="text-danger">Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>

	<!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
<!-- 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->
	<script src="/bnnm/js/script01.js" type="text/javascript"></script>
</body>
</html>
