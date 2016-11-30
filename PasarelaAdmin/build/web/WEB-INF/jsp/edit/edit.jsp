<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Hola desde Spring Web MVC</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
    <header class="header">
    <div class="header" style="height: 150px; width: 100%; background:#61859F; text-align: center; border-bottom: 2px solid #D6DBDF;">
		<img style="height:100%;" src="${pageContext.request.contextPath}/resources/img/fisi-unmsm.bmp"/>
    </div>
    </header>
        <div class="container">
            <ol class="breadcrumb">
                <li><a href="<c:url value="/cargarData.htm" />">Regresar</a></li>
                <li class="active">Editar</li>
            </ol>
                <div class="panel-heading" style="background: #DBA901">Editar</div>
                <div class="panel-body">
                   
                        <form:form method="post" commandName="usuarios">
                            <h1>Complete el formulario</h1>
                            
                            <form:errors path="*" element="div" cssClass="alert alert-danger" />
                            
                            <p>
                                <form:label path="nombre">Nombre:</form:label>
                                <form:input path="nombre" cssClass="form-control" />                               
                            </p>
                            
                            <p>
                                <form:label path="codigo">Codigo:</form:label>
                                <form:input path="codigo" cssClass="form-control" />                               
                            </p>
                            
                            <p>
                                <form:label path="correo">Correo:</form:label>
                                <form:input path="correo" cssClass="form-control" />                              
                            </p>
                           
                            <p>
                                <form:label path="escuela">Escuela</form:label>
                                <form:input path="escuela" cssClass="form-control" />
                            </p>
                            <hr />
                            <input type="submit" value="Enviar" style="background: #DBA901" class="btn btn-danger" />
                        </form:form>
                </div>
            </div>
    <!-- FOOTER-->
    <div class="copyrights" style="background-color: #2d2d2d; height: 100px; text-align: center; border-bottom: 2px solid #D6DBDF;">
	<p style="color: white; font-weight: bold;">Facultad de Ingenieria de Sistemas e Informatica -UNMSM | Pasarela de Pagos <a href="http://sistemas.unmsm.edu.pe/" target="_blank">FISI</a> </p>
	<div class="container" style="color: white ">
        <div class="row">
            	
        </div>
        </div>
        <div class="footer-copyright">
        <div class="container" style="color: white ">
         © 2016 Copyright Text
        </div>
        </div>
    </div>	
    </body>
</html>

