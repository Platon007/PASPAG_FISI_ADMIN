<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <a href="home.htm">
              <div class="barra"></div>
              <p class="menu">Salir</p>
            </a>
          </li>
        </ul>
      </div>
      <div class="article">
        <center><h2>Usuarios encontrados</h2></center>
        <p>
            <a href="<c:url value="add.htm" />" class="btn btn-default" style="background: #DBA901"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Agregar</a>
        </p>
        <div id="scroll1">
            <table class="table table-boredered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Id_ususario</th>
                            <th>Nombre</th>
                            <th>Codigo</th>
                            <th>Correo</th>
                            <th>Escuela</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${datos}" var="dato">
                            <tr>
                                <td><c:out value="${dato.id_usuarios}" /></td>
                                <td><c:out value="${dato.nombre}" /></td>
                                <td><c:out value="${dato.codigo}" /></td>
                                <td><c:out value="${dato.correo}" /></td>
                                <td><c:out value="${dato.escuela}" /></td>
                                <td>
                                    <a href="<c:url value="edit.htm?id=${dato.id_usuarios}" />"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                                    <a href="<c:url value="delete.htm?id=${dato.id_usuarios}" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        <section>
          <h4>Cargar data de alumno</h4>
          <form method="post" action="accion.php" enctype="multipart/form-data">
              <div class="row">
                <div class="col-md-4">
                    <input name="imagen" type="file" />
                </div>
                  <div class="col-md-8">
                      <a type="button" class="btn btn-default" style="background: #DBA901" href="Excel.htm"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>IMPORTAR</a> 
                  </div>
              </div>            
          </form>
        </section>
      </div>
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
