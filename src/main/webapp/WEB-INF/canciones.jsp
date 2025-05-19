<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listado de canciones</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

<div class="container">
	<div class="row">
		<h1>Lista de Canciones</h1>
	</div>
	<div class="row">
		<c:forEach items="${listaDeCancions}" var="canciones">
			<div class="col-3">
			  <div class="card tarjeta-canciones h-100">
			    <div class="card-body">
			      <h5 class="card-title">${canciones.titulo}</h5>
			      <p class="card-text"><strong>Banda:</strong> ${canciones.banda}</p>
			      <p class="card-text"><strong>Album:</strong> ${canciones.album}</p>
					<a href="/canciones/detalle/${canciones.id}"> Ver más </a>		
					
					<form action="/canciones/formulario/editar/${canciones.id}" method="GET">
						<button>
							Editar
						</button>
					</form>
										
	
						
			    </div>
			  </div>
			</div>
		</c:forEach>
		<form action="/canciones/formulario/agregar/${ultimaCancion.id}">
		<button>
			Agregar
		</button>	
		</form>
	</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76A09c02ndjd+DDb3tO5LYe0Q5FhU9X1bJzI2+7qbzNE4QY5f5C5JvJXkk+zN0P" crossorigin="anonymous"></script>

</body>
</html>