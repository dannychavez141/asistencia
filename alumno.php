
<!DOCTYPE html>
<html lang="zxx">
<?php error_reporting(0);
 
 include_once'./cabezera2.php'; 
$conf=$_GET['tconf'];
if ($conf) {
 echo "<script>alert('Operacion Realizada exitosamente');</script>";

} ?>

<body>
   
        <section class="principal">

  <h1>Alumnos Registrados</h1>

  <div class="formulario">
    <label for="caja_busqueda">Buscar</label>
    <input type="text" name="caja_busqueda" id="caja_busqueda"></input> <a href="regalumno.php"><button class="btn btn-success">AGREGAR ALUMNO</button></a>

    
  </div>

  <div id="datos"></div>

</section>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/balumno.js"></script>
</body>

</html>
