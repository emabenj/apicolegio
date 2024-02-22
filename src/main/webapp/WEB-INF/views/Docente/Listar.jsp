<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<link rel="shortcut icon" href="../imgs/logo.png">
    <title>Docentes</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
    
</head>
<body>
	<%@ include file="../Templates/UsuarioAEncabezado.jsp" %>
    <div class="container-fluid">
        <h1>DOCENTES:</h1>
        <form>
			<div class="container-fluid row">
				<div class="row">
					<div class="col row col-md-6" id="rbtnsNE">
					    <div class="form-check">
						    <input class="form-check-input" name="rbtnNE" type="radio" id="rb1L" value="Primaria">
						    <label class="form-check-label" for="rb1L">Primaria</label>
						</div>
						<div class="form-check">
						    <input class="form-check-input" name="rbtnNE" type="radio" id="rb2L" value="Secundaria">
						    <label class="form-check-label" for="rb2L">Secundaria</label>
						</div>
					</div>
					<div class="col row col-md-6" id="rbtnsT">
					    <div class="form-check">
						    <input class="form-check-input" name="rbtnT" type="radio" id="rbTML" value="M">
						    <label class="form-check-label" for="rbTML">Mañana</label>
						</div>
						<div class="form-check">
						    <input class="form-check-input" name="rbtnT" type="radio" id="rbTTL" value="T">
						    <label class="form-check-label" for="rbTTL">Tarde</label>
						</div>
					</div>
				</div>
					
				<select class="form-control col" id="cursosD">
				    <option value="0">Todos los cursos</option>
				</select>
				<label class="form-control col ml-3 text-right font-weight-bold border-0">Filtrar por:</label>
				<select class="form-control col ml-3" id="filtro">
				    <option value="0" label="Nombres"></option>
				    <option value="1" label="Apellidos"></option>
				    <option value="2" label="Sexo"></option>
				    <option value="3" label="Fecha de Registro"></option>	        		
				</select>
				<input id="buscador" class="form-control col ml-2" type="search" placeholder="Buscar" aria-label="Search">
				
				<div class="col row ml-2 d-none" id="rbtns">
				    <div class="form-check col">
					    <input class="form-check-input" name="rbtnsexo" type="radio" id="rbML" value="M">
					    <label class="form-check-label" for="rbML">Masculino</label>
					</div>
					<div class="form-check col">
					    <input class="form-check-input" name="rbtnsexo" type="radio" id="rbFL" value="F">
					    <label class="form-check-label" for="rbFL">Femenino</label>
					</div>
				</div>
			    <div class="col d-none ml-2" id="ffch">
			        <input type="date" class="form-control" id="fechaRF">
			    </div>			    
			</div>        	
		</form>
	    
        <c:if test="${not empty docentesL}">
            <table class="table table-dark table-bordered mt-5" id="tablaD">
                <thead>
                    <tr>
                        <th scope="col">Código</th>
                        <th scope="col">Nombres</th>
                        <th scope="col">Apellidos</th>
                        <th scope="col">Contacto</th>
                        <th scope="col">Fecha de Registro</th>
                        <th scope="col">Curso</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${docentesL}" var="docente">
                        <tr>
                            <td scope="row">${docente.docente_cod}</td>
                            <td>${docente.nombres}</td>
                            <td>${docente.apellidoP} ${docente.apellidoM}</td>
                            <td>${docente.celular}</td>
                            <td>${docente.fRegistro}</td>
                            <td>${docente.curso.nombre}</td>
                            <td>
                            	<button class="btn btn-primary btn-sm" onclick="mostrarInfo('${docente.docente_cod}')">Ver más</button> |
                            	<a href="/bnnm/docentes/editar/${docente.docente_cod}" class="text-success">
                            		<img src="/bnnm/imgs/editar-u.png" alt="Editar Docente" class="img-fluid icon-link" style="height: 2em"/>
                            	</a> | 
                            	<a href="/bnnm/docentes/eliminar/${docente.docente_cod}" class="text-danger">
                            		<img src="/bnnm/imgs/deleted.png" alt="Eliminar Docente" class="img-fluid icon-link" style="height: 2em"/>	
                            	</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
    
    <div class="modal fade" id="modalDocente" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Información del Docente</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<div class="row align-items-center mb-2">
				<div class="col"></div><img id="imgD" class="col img-fluid h-25 w-25" alt="Docente"><div class="col"></div>
	        </div>
	        <div class="align-items-center">
				<p class="text-center"><strong>Nombres:</strong> <span id="nombresD"></span></p>
				<p class="text-center"><strong>Apellidos:</strong> <span id="apellidoPD"></span> <span id="apellidoMD"></span></p>
				<p class="text-center"><strong>DNI:</strong> <span id="dniD"></span></p>
				<p class="text-center"><strong>Correo:</strong> <span id="correoD"></span></p>
				<p class="text-center"><strong>Dirección:</strong> <span id="direccionD"></span></p>
				<p class="text-center"><strong>Celular:</strong> <span id="celularD"></span></p>
				<p class="text-center"><strong>Fecha de Registro:</strong> <span id="fRegistroD"></span></p>	                
       		</div>
       		<div class="row align-items-center">
				<div class="col-3"></div>
					<button id="cambiarClaveL" class="col btn btn-success">Cambiar clave</button>
     			<div class="col-3"></div>
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
	
	<script src="/bnnm/js/script01.js" type="text/javascript"></script>
	<script src="/bnnm/js/script02.js" type="text/javascript"></script>
	<script src="/bnnm/js/scriptDocente.js" type="text/javascript"></script>
</body>
</html>
