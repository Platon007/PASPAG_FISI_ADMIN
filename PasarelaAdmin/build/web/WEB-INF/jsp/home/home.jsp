<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>PasarelaAdmin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Pasarela de pagos</title>
        <!-- Bootstrap -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/alertify.min.js"></script>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/alertify.core.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/alertify.default.css">
        
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/estilos.css" rel="stylesheet" type="text/css"/>
        
        <script>
            
            function comprobar(){
            	//var codigo = document.getElementById('#inputEmail1').value;
                
                  var x = document.forms["myForm"]["code"].value;
              
                    if(x===""){
                        $('#alert').html('Debes de ingresar un codigo').slideDown(500);
                        alert(" Ingresar el Codigo");
                        $('#inputEmail1').focus();
                    }else if(x.length > 10){
                        
                        alert(" El codigo es muy extenso  ");
                        $('#inputEmail1').focus();
                        
                    }
            }   
                       
        </script>
    </head> 

    <body>
    <h1>Registro De Login</h1>
    <form action='login.htm' method='POST' onsubmit= "return comprobar()" > 
     
    <div class="bg-log"></div>  
    <div class="login-table">
      <div class="login-cell">
        <div class="login-container">
          <div class="login-header">
            <img src="${pageContext.request.contextPath}/resources/img/logo_unmsm.png">
            <h2>Administracion de Pagos</h2>
          </div>
          <div class="login-body">
            <div class="clearfix sign">
              
                <div class="form-group">
                  <div class="col-xs-12">
                    <label for="inputEmail1" class="control-label" >Código</label>
                    <input name="name" type="text" class="form-control" id="inputEmail1" name="code" placeholder="Ejm: 0945685">
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-xs-12">
                    <label for="inputEmail2" class="control-label">Contraseña</label>
                <input name="password" type="password" class="form-control" id="inputEmail2" placeholder="********">
                  </div>
                </div>
               
                <div class="form-group">
                  <div class="col-xs-12">
                      <input type="submit" class="btn btn-send" id="btnIngresar"></input>
            
                      <c:forEach items="${m}" var="mensaje">
                          
                          <center><label  class="control-label"><c:out value="${m}"/></label></center>            
                      </c:forEach>
                              
                    <!-- button type="submit" class="btn btn-primary">Regresar</button -->
                                      
                  </div>
                </div>              
            </div>
          </div>
        </div>
      </div>
    </div>           
  </form>          
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
   
      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>    
