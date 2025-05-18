<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ page import="java.util.*, java.text.*" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formulario Agregar cancion</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<h1> Agregar Canciones </h1>
		</div>
		
		<div>
		<form:form action="/canciones/procesa/agregar" method="POST" modelAttribute="cancion">
				<div>
					<form:label path="titulo">  
						Titulo:
					</form:label>
					<form:input path="titulo" />	
					<form:errors path="titulo" />
				</div>
				
				<div>
					<form:label path="banda">  
							Nombre del Banda
					</form:label>
					<form:input path="banda" />
					<form:errors path="banda" />
				</div>		
				
				<div>
					<form:label path="album">  
							Nombre del Album:
					</form:label>
					<form:input path="album" />
					<form:errors path="album" />
				</div>			
						
				<div>
					<form:label path="genero">  
							Genero:
					</form:label>
					<form:input path="genero" />	
					<form:errors path="genero" />
				</div>		

				<div>
					<form:label path="idioma">  
							Idioma:
					</form:label>
					<form:input path="idioma" />	
					<form:errors path="idioma" />
				</div>	
		
				<button> Agregar </button>
			</form:form>	
		</div>
	</div>
</body>
</html>