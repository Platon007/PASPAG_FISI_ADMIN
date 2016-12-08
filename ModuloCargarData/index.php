<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8"/>
    <title>Bootstrap File Upload</title>
        
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
       
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/fileinput.min.js" type="text/javascript"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js" type="text/javascript"></script>
   
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <title>Pasarela de pagos</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="css/index_style.css" rel="stylesheet" type="text/css"/>

</head>
    
	<body>
    
    <header class="header">
    <div class="header" style="height: 150px; width: 100%; background:#61859F; text-align: center; border-bottom: 2px solid #D6DBDF;">
		<img style="height:100%;" src="img/fisi-unmsm.bmp"/>
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
            <a class="active" href="http://localhost:47053/PasarelaAdmin/cargarData.htm">
              <div class="barra"></div>
              <p class="menu">Cargar Data</p>
            </a>
          </li>
          <li>
            <a href="http://localhost:47053/PasarelaAdmin/buscarAlumno.htm">
              <div class="barra"></div>
              <p class="menu">Buscar Alumno</p>
            </a>
          </li>
         
          <li>
            <a href="http://localhost:47053/PasarelaAdmin/home.htm">
              <div class="barra"></div>
              <p class="menu">Salir</p>
            </a>
          </li>
        </ul>
      </div>
      <div class="article" style="padding: 10px 150px 500px 85px;">
        <div class="panel-heading" style="width: 850px; background: #CE9105; padding-top: 10px; color: white">Modulo de Economia >> Cargar data de recaudacion</div>
        <br/>
        
        <section>
        	<div class="contariner">
    			<input id="archivos" name="imagenes[]" type="file" multiple=true class="file-loading">
    			</div>
          <br/>
          <br/>
          <div class="col-md-12" style="float: right">
                      <a type="button" class="btn btn-default" style="background: #DBA901; color: white" href="http://localhost:47053/PasarelaAdmin/Excel.htm"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>IMPORTAR</a> 
                </div>      
        </section>
      </div>
    </div>
    </section>
    <br/>
    <!-- FOOTER-->
    <div class="copyrights" style="background-color: #2d2d2d; height: 50px; text-align: center; border-bottom: 2px solid #D6DBDF;">
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

	<?php 	
	$directory = "imagenes_/";
	

	$images = glob($directory . "*.*");
	?>
	
	<script>
	$("#archivos").fileinput({
	uploadUrl: "upload.php", 
    uploadAsync: false,
    minFileCount: 1,
    maxFileCount: 20,
	showUpload: false, 
	showRemove: false,
	initialPreview: [
	<?php foreach($images as $image){?>
		"<img src='<?php echo $image; ?>' height='120px' class='file-preview-image'>",
	<?php } ?>],
    initialPreviewConfig: [<?php foreach($images as $image){ $infoImagenes=explode("/",$image);?>
	{caption: "<?php echo $infoImagenes[1];?>",  height: "120px", url: "borrar.php", key:"<?php echo $infoImagenes[1];?>"},
	<?php } ?>]
	}).on("filebatchselected", function(event, files) {
	
	$("#archivos").fileinput("upload");
	
	});
	
	</script>
</html>