
<!DOCTYPE html>
<html lang="zxx">
<?php 
 
 include_once'./cabezera2.php';
  include_once'./control/conexion.php';  
$cur=$_GET['cur'];
$anio=$_GET['anio'];
 $iddoc=$_GET['cod'];
/*if ($conf) {
 echo "<script>alert('Operacion Realizada exitosamente');</script>";
}*/

 // Establecer la zona horaria predeterminada a usar. Disponible desde PHP 5.1
date_default_timezone_set('UTC');
// Imprime algo como: Monday

$dia=date("Y-m-d");
?>

<body>
   
        <section class="principal">

  <h1>Clases Registradas</h1>

  <div class="formulario">
    <label for="caja_busqueda">Buscar</label>
    <input type="text" name="caja_busqueda" id="caja_busqueda"></input>

    <input type="hidden" id="cur" value="<?php echo $cur ?>">
    <input type="hidden" id="anio" value="<?php echo $anio ?>">
  </div>
<center>
    <br>
<table>

    <?php  
        $query = "SELECT * FROM asistencia.docente where idDocente= $iddoc;";

    $resultado = $mysqli->query($query);

 while ($fila = $resultado->fetch_array()) { ?>
<tr><td><h3>DOCENTE:</h3></td><td><h3><?php echo $fila[1]." ".$fila[2]." ".$fila[3]; ?></h3></td></tr>
<?php } ?>
</table></center>
  <div id="datos"></div>

</section>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/blistaasistencia.js"></script>
</body>

</html>
