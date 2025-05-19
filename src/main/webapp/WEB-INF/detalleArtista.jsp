<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detalle de ${artista.nombre} ${artista.apellido}</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="card shadow-sm mx-auto" style="max-width: 700px;">
            <div class="card-header bg-info text-white">
                <h3 class="mb-0">${artista.nombre} ${artista.apellido}</h3>
            </div>
            <div class="card-body">
                <p><strong>Biografía:</strong> ${artista.biografia}</p>

                <h5 class="mt-4">Canciones del artista:</h5>
                <ul class="list-group">
                    <c:forEach var="cancion" items="${artista.canciones}">
                        <li class="list-group-item">${cancion.titulo}</li>
                    </c:forEach>
                </ul>

                <a href="/artistas" class="btn btn-outline-primary mt-4">Volver a lista de artistas</a>
            </div>
        </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
