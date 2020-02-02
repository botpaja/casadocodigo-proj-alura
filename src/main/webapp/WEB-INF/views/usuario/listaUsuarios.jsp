<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<c:url value="/" var="contextPath" />
<tags:pageTemplate titulo="Lista de Usuarios">

<body>
<div class="container">
		<a href="${s:mvcUrl('UC#cadastra').build() }" rel="nofollow"><fmt:message key="menu.cadastro_usuarios"/></a>
		<h1><fmt:message key="listaUsuario.tituloPagina"/></h1>
	
		<table class="table table-bordered table-striped table-hover">
			<tr>
				<th><fmt:message key="listaUsuario.nome"/></th>
				<th><fmt:message key="listaUsuario.email"/></th>
				<th><fmt:message key="listaUsuario.role"/></th>
				<th></th>
			</tr>
			<c:forEach items="${usuarios }" var="usuario">
				<tr>
					<td>${usuario.nome }</td>
					<td>${usuario.email }</td>
					<td>${usuario.imprimeRoles() }</td>
					<td><form:form action="${s:mvcUrl('UC#formRoleUsuario').arg(0, usuario.email).build() }" method="POST">
               		 		<input type="image" src="${contextPath}resources/imagens/editar.png" alt="Editar" title="Editar"/>
             			 </form:form></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</tags:pageTemplate>
</html>