<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<tags:pageTemplate titulo="Pedidos">
	<h1><fmt:message key="listaPedidos.tituloPagina"/></h1>
	<table class="table table-bordered table-striped table-hover">
		<tr>
			<th><fmt:message key="listaPedidos.id"/></th>
			<th><fmt:message key="listaPedidos.valor"/></th>
			<th><fmt:message key="listaPedidos.dataPedido"/></th>
			<th><fmt:message key="listaPedidos.titulo"/></th>
		</tr>
		<c:forEach items="${pedidos }" var="pedidos">
				<c:forEach items="${pedidos.produtos }" var="produtos">
			<tr>
				<td>
				${pedidos.id }
				</td>
				<td>${pedidos.valor }</td>
				<td><fmt:formatDate pattern="dd/MM/yyyy"
                            value="${pedidos.dataPedido.time}" /></td>
				<td>${produtos.titulo }</td>
			</tr>
				</c:forEach>
		</c:forEach>
	</table>
</tags:pageTemplate>
</html>