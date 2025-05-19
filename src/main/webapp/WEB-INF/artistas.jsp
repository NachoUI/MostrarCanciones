<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listado de artistas</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

<div class="container">
	<div class="row">
		<h1>Lista de Artistas</h1>
	</div>

	<div class="row">
		<c:forEach items="${listaDeArtistas}" var="artista">
			<div class="col-12 mb-2">
				<a href="/artistas/detalle/${artista.id}" class="btn btn-outline-primary">
					${artista.nombre} ${artista.apellido}
				</a>
			</div>
		</c:forEach>
	</div>

	<div class="row mt-4">
		<div class="col-12">
			<a href="/canciones" class="btn btn-success">Ir a canciones</a>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76A09c02ndjd+DDb3tO5LYe0Q5FhU9X1bJzI2+7qbzNE4QY5f5C5JvJXkk+zN0P" crossorigin="anonymous"></script>

</body>
</html>
