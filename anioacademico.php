
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

  <h1>Años Academicos Registrados</h1>

  <div class="formulario">
    <label for="caja_busqueda">Buscar</label>
    <input type="text" name="caja_busqueda" id="caja_busqueda"></input> <a href="reganiouniversitario.php"><button class="btn btn-success">AGREGAR A.ACADEMICO</button></a>

    
  </div>

  <div id="datos"></div>

</section>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/banioacademico.js"></script>
</body>

</html>
