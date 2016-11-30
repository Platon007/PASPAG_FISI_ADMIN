<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset=UTF-8"/>
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
         <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/resources/style/index_style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container" style="padding: 50px;">
            <div>
                <center><h1>Relacion de alumnos</h1></center>
                
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
                                <td><c:out value="${dato.id_usuario}" /></td>
                                <td><c:out value="${dato.nombre}" /></td>
                                <td><c:out value="${dato.codigo}" /></td>
                                <td><c:out value="${dato.correo}" /></td>
                                <td><c:out value="${dato.escuela}" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                </div>
            </div>
        </div>
    </body>
</html>
