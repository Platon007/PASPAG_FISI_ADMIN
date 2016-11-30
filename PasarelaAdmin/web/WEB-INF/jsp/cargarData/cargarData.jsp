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
         <body>
       <script language="JavaScript" type="text/javascript">
           alert("Logueado con exito");
</script>
    <header class="header">
    <div>
      <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/cabecera1.jpg"></div>
    </div>
    </header>
    <section class="section-inx">
    <div>
      <div class="aside">
        <ul class="nav nav_aside">
          <li>
            <a href="home.htm">
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
            <a href="<c:url value="add.htm" />" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Agregar</a>
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
          <input name="imagen" type="file" />
          </form>
        </section>
          <div class="form-group">
                  <div class="col-xs-12">
                      <a type="button" class="btn btn-send" href="Excel.htm">IMPORTAR</a> 
                  </div>
                </div>
      </div>
    </div>
    </section>
    <footer>
    <div>
      <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/footer.png"></div>
    </div>
    </footer>
        
    </body>
</html>
