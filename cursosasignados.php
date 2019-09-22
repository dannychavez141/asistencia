
<!DOCTYPE html>
<html lang="zxx">
<?php error_reporting(0);
 
 include_once'./cabezera2.php'; 
 include_once'./control/conexion.php'; 
 $iddoc=$_GET['cod'];
if ($conf) {
 echo "<script>alert('Operacion Realizada exitosamente');</script>";

} ?>

<body>
   
        <section class="principal">

  <h1>Cursos asignados al docente.</h1>

  <div class="formulario">


   
    AÑO ACADEMICO 
    <select id="anio" onchange="buscar()">
        <?php  
        $query = "SELECT * FROM anioacademico where est=1;";
    $resultado = $mysqli->query($query);

 while ($fila = $resultado->fetch_array()) { ?>
<option value="<?php echo $fila[0]; ?>"><?php echo $fila[1]; ?></option>

<?php } ?>


    </select>
    
    <input type="hidden" id="doc" value="<?php echo $iddoc; ?>">
    <a href="asigdocente.php"><button class="btn btn-success">Agregar Asignaciones</button></a>

    
  </div> <center>
    <br>
<table>

    <?php  
        $query = "SELECT * FROM docente where idDocente= $iddoc;";

    $resultado = $mysqli->query($query);

 while ($fila = $resultado->fetch_array()) { ?>
<tr><td><h3>DOCENTE:</h3></td><td><h3><?php echo $fila[1]." ".$fila[2]." ".$fila[3]; ?></h3></td></tr>
<?php } ?>
</table></center>
  <div id="datos"></div>

</section>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bcursoasignado.js"></script>
</body>

</html>
