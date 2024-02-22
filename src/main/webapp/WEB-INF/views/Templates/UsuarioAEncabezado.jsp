<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<security:authorize access="isAuthenticated()">
	<security:authentication property="principal.nombres" var="nombres"/>
	<security:authentication property="principal.apellidos" var="apellidos"/>
    <security:authentication property="principal.authorities" var="authorities"/>
    
    <c:set value="${nombres} ${apellidos}" var="usuario"/>
    
	<c:forEach items="${authorities}" var="auth">
	    <c:if test="${auth.authority eq 'ROLE_Admin'}">
	        <c:set value="Administrador" var="usuario"></c:set>
	    </c:if>
	</c:forEach>	
	<header class="navbar navbar-expand-lg navbar-dark bg-secondary mb-5 sticky-top">
	    <div class="container-fluid">
	        <a class="navbar-brand text-dark" href="/bnnm/home/" >
	            <img src="/bnnm/imgs/logo.png" alt="Nombre del Colegio" class="img-fluid"  style="height: 3em">
	            <span class="font-weight-bold p-2">BNNM</span>
	        </a>
			<a class="ml-5" href="#" hidden="true" id="aRegreso">
			    <img src="/bnnm/imgs/back.png" alt="Regresar" class="img-fluid" style="height: 4em" />
			</a>
			
	        <div class="collapse navbar-collapse" id="navbarSupportedContent">
	        	<ul class="navbar-nav mr-auto ml-5" hidden="true" id="accionesDoc">        		
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle p-2" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Acciones</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">							
							<a class="dropdown-item" href="/bnnm/notas/" id="aNotas" hidden="true">Notas</a>
							<a class="dropdown-item" href="/bnnm/asistencias/" id="aAsistencias" hidden="true">Asistencia</a>
							
							<a class="dropdown-item" href="#" id="aRegistro" hidden="true">Registrar</a>
							<a class="dropdown-item" href="#" id="aUsuarioDel" hidden="true">Usuarios eliminados</a>						  	
						</div>
					</li>		        
				</ul>
	        	
	            <ul class="navbar-nav ml-auto">
	            	<li class="nav-item">
	            		<img src="/bnnm/imgs/usuario.png" alt="Usuario logeado" class="img-fluid"  style="height: 3em">
	            	</li>
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                    	<span id="userShow" class="font-weight-bold p-3 w-25">${usuario}</span>
	                    </a>
	                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item text-dark" href="#" id="aAdminC" hidden="true">Administrar Cuenta</a>
							<a class="dropdown-item text-dark" href="/bnnm/usuarios" id="aAdminU" hidden="true">Administrar Usuarios</a>
							
							<a class="dropdown-item text-dark" href="/bnnm/docente/editar-perfil" id="aDocE" hidden="true">Editar Perfil</a>
							
							<a class="dropdown-item text-dark" href="/bnnm/logout">Salir</a>                        
	                    </div>
	                    
	                </li>                
	            </ul>
	        </div>
	    </div>    
	</header>
</security:authorize>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/bnnm/js/scriptEncabezado.js" type="text/javascript"></script>