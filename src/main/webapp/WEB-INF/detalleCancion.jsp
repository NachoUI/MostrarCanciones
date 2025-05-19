<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> ${cancion.titulo} </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="card shadow-sm mx-auto" style="max-width: 600px;">
            <div class="card-header bg-primary text-white">
                <h3 class="mb-0">${cancion.titulo}</h3>
            </div>
            <div class="card-body">
                <p><strong>Banda:</strong> ${cancion.banda}</p>
                <p><strong>Álbum:</strong> ${cancion.album}</p>
                <p><strong>Género:</strong> ${cancion.genero}</p>
                <p><strong>Idioma:</strong> ${cancion.idioma}</p>
                <p><strong>Fecha de Creación:</strong> ${cancion.fechaCreacion}</p>
                <p><strong>Última Actualización:</strong> ${cancion.fechaActualizacion}</p>
                <a href="/canciones" class="btn btn-outline-primary mt-3">Volver atrás</a>
			<form action="/canciones/eliminar/${cancion.id}" method="POST">
			    <input type="hidden" name="_method" value="DELETE">
			    <button type="submit" class="btn btn-danger">Eliminar</button>
			</form>	
            </div>
        </div>
    </div>

	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76A09c02ndjd+DDb3tO5LYe0Q5FhU9X1bJzI2+7qbzNE4QY5f5C5JvJXkk+zN0P" crossorigin="anonymous"></script>
	
</body>
</html>