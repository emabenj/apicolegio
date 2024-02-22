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
                        <th scope="col">Código</th>
                        <th scope="col">Nombres</th>
                        <th scope="col">Apellidos</th>
                        <th scope="col">Nivel Educativo</th>
                        <th scope="col">Grado</th>
                        <th scope="col">Sección</th>
                        <th scope="col">Turno</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Cursos</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${alumnosL}" var="alumno">
                        <tr>
                        	<th scope="row">${alumno.alumnoId}</th>
                        	<td>${alumno.alumno_cod}</td>
                            <td>${alumno.nombres}</td>
                            <td>${alumno.apellidoP} ${alumno.apellidoM}</td>
                            <td>${alumno.nEducativo}</td>
                            <td>${alumno.grado}</td>
                            <td>${alumno.seccion}</td>
                            <td>${alumno.turno}</td>
                            <td>${alumno.estado}</td> 
                            <td>${alumno.itemsCurso.size()}</td>                           
                            <td>
                            	<button class="btn btn-info btn-sm" onclick="mostrarCursos(${alumno.alumnoId})">Ver Cursos</button> | 
                            	<a href="/bnnm/alumnos/editar/${alumno.alumnoId}" class="text-success">
                            		<img src="/bnnm/imgs/editar-u.png" alt="Editar Alumno" class="img-fluid icon-link" style="height: 2em"/>
								</a> | 
                            	<a href="/bnnm/alumnos/eliminar/${alumno.alumnoId}" class="text-danger">
                            		<img src="/bnnm/imgs/deleted.png" alt="Eliminar Alumno" class="img-fluid icon-link" style="height: 2em"/>	
								</a>
                            </td>                            
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
    <div class="modal fade" id="modalAlumno" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Cursos del Alumno</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">			
			<div class="align-items-center">
				<ul class="list-group" id="cursosInfo">
<!-- 					<li class="list-group-item d-flex justify-content-between align-items-center"> -->
<!-- 					  NombreCurso -->
<!-- 					  <span id="nota1" class="badge badge-primary badge-pill">14</span> -->
<!-- 					</li> -->
			    </ul>
			</div>
	          
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
	      </div>
	    </div>
	  </div>
	</div>
    
    <!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"></script>
	
	<script src="/bnnm/js/scriptAlumno.js" type="text/javascript"></script>
</body>
</html>
