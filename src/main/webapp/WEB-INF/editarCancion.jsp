<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
     <%@ page import="java.util.*, java.text.*" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
    <%@ page isErrorPage="true" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Cancion</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<h1> Editar Canciones </h1>
		</div>
		
		<div>
<form:form action="/canciones/formulario/editar/${cancion.id}" method="POST" modelAttribute="cancion">
    <input type="hidden" name="_method" value="PUT" />
		
				<div>
					<form:label path="titulo">  
						Titulo:
					</form:label>
					<form:input path="titulo" value="${cancion.titulo}" />	
					<form:errors path="titulo" />
				</div>
				
				<div>
					<form:label path="banda">  
							Nombre del Banda
					</form:label>
					<form:input path="banda" value="${cancion.banda}" />
					<form:errors path="banda" />
				</div>		
				
				<div>
					<form:label path="album">  
							Nombre del Album:
					</form:label>
					<form:input path="album"  value="${cancion.album}"/>
					<form:errors path="album" />
				</div>			
						
				<div>
					<form:label path="genero">  
							Genero:
					</form:label>
					<form:input path="genero" value="${cancion.genero}" />	
					<form:errors path="genero" />
				</div>		

				<div>
					<form:label path="idioma">  
							Idioma:
					</form:label>
					<form:input path="idioma" value="${cancion.idioma}" />	
					<form:errors path="idioma" />
				</div>	
		
				<button> Editar </button>
			</form:form>	
		</div>
	</div>
</body>
</html>