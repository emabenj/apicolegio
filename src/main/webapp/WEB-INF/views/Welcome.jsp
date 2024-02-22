<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Librería Spring Tag -->
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="/bnnm/imgs/logo.png">
	<title>Welcome</title>
	
    <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
	</head>
<body>	
	<div align="center">	
		<h3>Welcome</h3>
		
		<security:authorize access="!isAuthenticated()">
			<a href="/bnnm/login">Iniciar Sesión</a>
		</security:authorize>
		
		<security:authorize access="isAuthenticated()">
			<security:authentication property="principal.username" var="username"/>
			¡Hola ${username}! <a href="/bnnm/logout">Logout</a> <br><br>
			<c:choose>
				<c:when test="${username != 'admin'}">
					<a href="/bnnm/docente">Docente</a>
				</c:when>
				<c:otherwise>
					<a href="/bnnm/admin">Administrador</a>
				</c:otherwise>
			</c:choose>		 	
		</security:authorize>
	</div>
	
</body>
</html>