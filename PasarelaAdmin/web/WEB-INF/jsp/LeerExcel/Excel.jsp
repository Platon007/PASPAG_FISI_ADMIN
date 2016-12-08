<%-- 
    Document   : Excel
    Created on : 28-nov-2016, 17:35:18
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="pe.edu.sistemas.modelo.Usuarios"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="org.hibernate.validator.constraints.Email"%>
<%@page import="java.io.IOException"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@include file="Conexion.jsp"%>
<%@page import="pe.edu.sistemas.modelo.ConexionJava"%>
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
           <script language="JavaScript" type="text/javascript">
           alert("DATOS IMPORTADOS CON EXITO!");
</script>
            
       <%
try{
 InputStream excelStream = null;
		 //ArrayList que servira para insertar los registros en la base de datos
		
                File excelFile= new File("C:\\xampp\\htdocs\\BootstrapFileupload\\imagenes_\\RegistroFisi.xls");
		 //Lectura del archivo excel
	        try {
	            excelStream = new FileInputStream(excelFile);
	          
	            // Representación del más alto nivel de la hoja excel.
	            HSSFWorkbook hssfWorkbook = new HSSFWorkbook(excelStream);
	          
	            // Elegimos la hoja que se pasa por parámetro.
	            HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
	            
	            // Objeto que nos permite leer un fila de la hoja excel, y de aquí extraer el contenido de las celdas.
	            HSSFRow hssfRow;
	          
	            // Inicializo el objeto que leerá el valor de la celda
	            HSSFCell cell;                        
	            
	            // Obtengo el número de filas ocupadas en la hoja
	            int rows = hssfSheet.getLastRowNum();
	            
	            // Obtengo el número de <span id="IL_AD10" class="IL_AD">columnas</span> ocupadas en la hoja
	            int cols = 0;            
	            
	            // Cadena que usamos para almacenar la lectura de la celda
	            String cellValue;  
	           
	            // Para este ejemplo vamos a recorrer las filas obteniendo los datos que queremos   
	            //Cambiar ese valor 2 por rows :D 
	            for (int r = 1; r < 20; r++) {
	                hssfRow = hssfSheet.getRow(r);
	                if (hssfRow == null){
	                    break;
	                }else{
	                    System.out.print("Row: " + r + " -> ");
	                    //Definicion del obejot alumno , uno por cada fila
	                   Usuarios alumno=new Usuarios();
	                    
	                    for (int c = 0; c < 20; c++) {
	                        /* 
	                             tenemos estos tipos de celda: 
	                                CELL_TYPE_BLANK, CELL_TYPE_NUMERIC, CELL_TYPE_BLANK, CELL_TYPE_FORMULA, CELL_TYPE_BOOLEAN, CELL_TYPE_ERROR
	                        */
	                    	
	                    	cellValue = hssfRow.getCell(c) == null?"":
                                (hssfRow.getCell(c).getCellType() == Cell.CELL_TYPE_STRING)?hssfRow.getCell(c).getStringCellValue():
                                (hssfRow.getCell(c).getCellType() == Cell.CELL_TYPE_NUMERIC)?"" + hssfRow.getCell(c).getNumericCellValue():
                                (hssfRow.getCell(c).getCellType() == Cell.CELL_TYPE_BOOLEAN)?"" + hssfRow.getCell(c).getBooleanCellValue():
                                (hssfRow.getCell(c).getCellType() == Cell.CELL_TYPE_BLANK)?"BLANK":
                                (hssfRow.getCell(c).getCellType() == Cell.CELL_TYPE_FORMULA)?"FORMULA":
                                (hssfRow.getCell(c).getCellType() == Cell.CELL_TYPE_ERROR)?"ERROR":"";
                        //Vista por consola para le monitoreo de los registros
                                System.out.print("[Column " + c + ": " + cellValue + "] ");
                       //Controlador Switch para añadir los valores al objeto alumno
                        switch(c){
                        case 0:
                        	alumno.setCodigo(cellValue);
                        	break;
                            case 1:
                            alumno.setNombre(cellValue);
                        	
                        	break;
                       
                   
                        case 2:
                             alumno.setCorreo(cellValue);
                                              
                        	
                        	break;
                        case 3:
                        	alumno.setEscuela(cellValue);
                        	break;
                          }
	                  }  String sqr="insert into usuario (name,code,email,eap) values ('"+alumno.getNombre()+"','"+alumno.getCodigo()+"','"+alumno.getCorreo()+"','"+alumno.getEscuela()+"')";
                    sql.executeUpdate(sqr);
                    System.out.println("cargado con exito");
                        }
                        
	            }
	            //prueba
	           
	            
	        } catch (FileNotFoundException fileNotFoundException) {
	            System.out.println("The file not exists (No se encontró el fichero): " + fileNotFoundException);
	        } catch (IOException ex) {
	            System.out.println("Error in file procesing (Error al procesar el fichero): " + ex);
	        } finally {
	            try {
	                excelStream.close();
	            } catch (IOException ex) {
	                System.out.println("Error in file processing after close it (Error al procesar el fichero después de cerrarlo): " + ex);
	            }
	        }   
}catch(Exception e){
    
}        
%>
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
            <a class="active" href="cargarData.htm">
              <div class="barra"></div>
              <p class="menu">Cargar Data</p>
            </a>
          </li>
          <li>
            <a href="buscarAlumno.htm">
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
        <div class="panel-heading" style="width: 850px; background: #CE9105; padding-top: 10px; color: white">Modulo de Economia >> Datos cargados exitosamente!</div>
        <br/>
        <div id="scroll1">
            <table class="table table-boredered table-striped table-hover">
                <thead id="inmovil">
                        <tr>
                            <th>Nombre</th>
                            <th>Codigo</th>
                            <th>Correo</th>
                            <th>Escuela</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${datos}" var="dato">
                            <tr>
                                <td><c:out value="${dato.name}" /></td>
                                <td><c:out value="${dato.code}" /></td>
                                <td><c:out value="${dato.email}" /></td>
                                <td><c:out value="${dato.eap}" /></td>
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
</section>
    <br/>
	<!-- FOOTER -->
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
