<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Pasarela de pagos</title>
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/resources/style/index_style.css" rel="stylesheet" type="text/css"/>
</head>
<body>    
    <header class="header">
        <div class="header" style="height: 150px; width: 100%; background:#61859F; text-align: center; border-bottom: 2px solid #D6DBDF;">
            <img style="height:100%;" src="${pageContext.request.contextPath}/resources/img/fisi-unmsm.bmp"/>
        </div>
    </header>    
       <section class="container">
      <div class="article">
            <ol class="breadcrumb">
                <li><a href="<c:url value="cargarData.htm" />">Regresar</a></li>
                <li class="active">Agregar</li>
            </ol>
                <div class="panel-heading" style="background: #DBA901">Unidad de economia</div>
                <div class="panel-body">
                   
                        <form:form method="post" commandName="usuarios">
                            <h1>Actualice los campos faltantes</h1>
                            
                            <form:errors path="*" element="div" cssClass="alert alert-danger" />
                            
                            <p>
                                <form:label path="nombre">Nombre:</form:label>
                                <form:input path="nombre" cssClass="form-control" />
                                
                            </p>
                            
                            <p>
                                <form:label path="codigo">Codigo</form:label>
                                <form:input path="codigo" cssClass="form-control" />
                            </p>
                            
                            <p>
                                <form:label path="correo">Correo electrónico</form:label>
                                <form:input path="correo" cssClass="form-control" />
                            </p>
                            
                            <p>
                                <form:label path="escuela">Escuela</form:label>
                                <form:input path="escuela" cssClass="form-control" />
                            </p>
                            <input type="submit" value="Enviar" class="btn btn-danger" />
                            <!--<a type="submit" value="Enviar" class="btn btn-default" style="background: #DBA901"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Enviar</a>-->
                        </form:form>
                </div>
            </div> 
            <br/>
            <br/>
            <br/>
    </section>
    <!-- FOOTER-->
    <div class="copyrights" style=" padding: 80px; background-color: #2d2d2d; height: 100px; text-align: center; border-bottom: 2px solid #D6DBDF;">
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
