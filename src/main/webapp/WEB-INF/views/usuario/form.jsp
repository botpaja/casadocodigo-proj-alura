<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<tags:pageTemplate titulo="Cadastro de Usuarios">
<body>
	<div class="container">
		<h1>Cadastro de Usuario</h1>
		<form:form action="${s:mvcUrl('UC#gravar').build() }" method="post"
			commandName="usuario" enctype="multipart/form-data">
			<div class="form-group">
				<label><fmt:message key="formUsuario.nome"/></label>
				<form:input path="nome" cssClass="form-control" />
				<form:errors path="nome" />
			</div>
			<div class="form-group">
				<label><fmt:message key="formUsuario.email"/></label>
				<form:textarea path="email" cssClass="form-control" />
				<form:errors path="email" />
			</div>
			<div class="form-group">
				<label><fmt:message key="formUsuario.senha"/></label>
				<form:input path="senha" cssClass="form-control" type="password" />
				<form:errors path="senha" />
			</div>
			<div class="form-group">
				<label><fmt:message key="formUsuario.senhaRepetida"/></label>
				<form:input path="senhaRepetida" cssClass="form-control" type="password"  />
				<form:errors path="senhaRepetida" />
			</div>
			<button type="submit" class="btn btn-primary">Cadastrar</button>
		</form:form>
	</div>
</body>
</tags:pageTemplate>
</html>