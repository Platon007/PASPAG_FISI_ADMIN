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
            <a class="active" href="cargarData.htm">
              <div class="barra"></div>
              <p class="menu">Cargar Data</p>
            </a>
          </li>
          <li>
            <a href="#">
              <div class="barra"></div>
              <p class="menu">Buscar Alumno</p>
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
      
      <div class="article" style="padding: 10px 150px 500px 85px;">
        <div class="panel-heading" style="width: 850px; background: #CE9105; padding-top: 10px; color: white">Modulo de Economia >> Buscar alumnos</div>
        <br/>
        <br/>
         <form action='buscar.htm' method='POST'  > 
         <div class="row">
                <div class="col-md-4">
                    <h5>Ingrese Codigo: </h5>
                    <input path="nombre" cssClass="form-control" name="AlumnoBuscar" />
                </div>
                  <div class="col-md-8">
                <input value="Buscar por Codigo" type="submit" class="btn btn-send" id="btnIngresar" style="background: #CE9105; color: white" ></input>
                  </div>
              </div>  
             <br/>
        </form>
         <div id="scroll1">
            <table class="table table-boredered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Codigo</th>
                            <th>Correo</th>
                            <th>Escuela</th>
                            <th>Pago realizado</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${datos}" var="dato"
                                   >
                            <tr>
                            
                                <td><c:out value="${dato.NAME}" /></td>
                                <td><c:out value="${dato.code}" /></td>
                                <td><c:out value="${dato.email}" /></td>
                                <td><c:out value="${dato.eap}" /></td>
                                <td><c:out value="${dato.ID_CONCEPTO}" /></td>
                                
                                <!--<td>
                                    <a href="<c:url value="edit.htm?id=${dato.code}" />"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                                    <a href="<c:url value="delete.htm?id=${dato.code}" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                                </td>-->
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
      </div>
    </div>
    </section>
    <br/>
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
