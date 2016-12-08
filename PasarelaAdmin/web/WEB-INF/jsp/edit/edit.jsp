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
    <section class="section-inx">
    <div>
      <div class="aside">
        <ul class="nav nav_aside">
          <li>
            <a href="http://sistemas.unmsm.edu.pe/">
              <div class="barra"></div>
              <p class="menu">Regresar a pagina principal</p>
            </a>
          </li>
          <li>
            <a class="active" href="#">
              <div class="barra"></div>
              <p class="menu">Cargar Data</p>
            </a>
          </li>
          <li>
            <a href="mostrarData.htm">
              <div class="barra"></div>
              <p class="menu">Verificar Alumnos</p>
            </a>
          </li>
          <li>
            <a href="buscarAlumno.htm">
              <div class="barra"></div>
              <p class="menu">Buscar Alumno</p>
            </a>
          </li>
          <li>
            <a href="nuevoPerfil.htm">
              <div class="barra"></div>
              <p class="menu">Nuevo Perfil</p>
            </a>
          </li>
          <li>
            <a href="home.htm">
              <div class="barra"></div>
              <p class="menu">Salir</p>
            </a>
          </li>
        </ul>
      </div>
      <div class="article" style="padding: 20px 200px 200px 150px;">
                <div class="panel-heading" style="color: white; background: #CE9105; padding-top: 10px; border-radius: 6px;">Modulo Administrador >> Creacion de un nuevo perfil</div>
                <div class="panel-body">
                   
                        <form:form method="post" commandName="usuario">
                            
                            <form:errors path="*" element="div" cssClass="alert alert-danger" />
                            
                            <p>
                                <form:label path="nombre">Nombre:</form:label>
                                <form:input path="nombre" cssClass="form-control" />                               
                            </p>
                            
                            <p>
                                <form:label path="codigo">Codigo:</form:label>
                                <form:input path="codigo" cssClass="form-control" disabled="true"/>                               
                            </p>
                            
                            <p>
                                <form:label path="correo">Correo:</form:label>
                                <form:input path="correo" cssClass="form-control" />                              
                            </p>
                           
                           <p>
                                <form:label path="escuela">Escuela</form:label>
                                <form:input path="escuela" cssClass="form-control" />
                            </p>
                            <br/>
                            <br/>
                            <input style=" background: #61859F" type="submit" value="Aceptar Correcion" class="btn btn-default" />
                            <!--<a type="submit" value="Enviar" class="btn btn-default" style="background: #DBA901"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Enviar</a>-->
                        </form:form>          
                </div>
            </div> 
            <br/>
            <br/>
            <br/>
    </div>
    </section>    

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

