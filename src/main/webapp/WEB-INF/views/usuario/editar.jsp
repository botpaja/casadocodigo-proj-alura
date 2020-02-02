<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Permissoes</title>
</head>
<tags:pageTemplate titulo="Lista de Usuarios">
<body>
<form:form servletRelativeAction="${s:mvcUrl('UC#atualizaRole').arg(0, usuarioParaEditar).build()}"
        method="POST" modelAttribute="usuarioParaEditar">
        <h1><fmt:message key="editarUsuario.titulo"/> ${usuarioParaEditar.nome}</h1>
        <form:checkboxes items="${roles}" path="roles"/>
        <form:hidden path="email" value="${usuarioParaEditar.email}"/>
        <br>
        <button type="submit">Atualizar</button>
      </form:form>
</body>
</tags:pageTemplate>
</html>