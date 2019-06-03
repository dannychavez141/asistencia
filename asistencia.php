
<!DOCTYPE html>
<html lang="zxx">
<?php error_reporting(0);
include_once'./cabezera2.php'; 
$id=$_GET['cod'];
require 'conexion.php';?>
 ?>

<body>
   
        <section class="principal">

  <h1>Asistencias Registradas en la clase</h1>
  <br>
   <?php $url="SELECT c.idClase,c.idAsignacionDoc,cu.descr as curso,d.nomDoc,d.apepaDoc,d.apemaDoc,aa.descr as auni,c.fechaClas,c.horClas,c.est,e.descr as estado FROM asistencia.clase c 
join asignaciondoc ad on c.idAsignacionDoc=ad.idAsignacionDoc 
join curso cu on ad.idCurso=cu.idCurso
join docente d on ad.idDocente=d.idDocente
join anioacademico aa on ad.idAnioAcademico=aa.idAnioAcademico
join estados e on c.est=e.idestados  where c.idClase=$id;";
                     $clase= $mysqli->query($url);

  while ($fila = $clase->fetch_array()) {
     if($fila[9]==1){
    $estado="Activo";
 }else {$estado="Inactivo";}
                       ?>
                       <table>

                       	<tr><td><h5>Curso:</h5></td><td><h5><?php echo $fila[2];?></h5></td></tr>
                      <tr>  <td><h5>Docente:</h5></td><td><h5><?php echo $fila[4].' '.$fila[5].' '.$fila[3];?></h5></td></tr>
                     <tr>    <td><h5>Fecha:</h5></td><td><h5><?php echo $fila[7];?></h5></td></tr>
                      <tr>    <td><h5>Hora:</h5></td><td><h5><?php echo $fila[8];?></h5></td></tr>
                       </table>

<?php  $id=$fila[0];} ?>
  <div class="formulario">
    <label for="caja_busqueda">Buscar Alumno en Asistencia</label>
    <input type="text" name="caja_busqueda" id="caja_busqueda"></input>
      <a href="reporteasis.php?cod=<?php echo $id;?> "><button class="btn btn-success">Imprimir Asistencia</button></a>  <input type="text" name="caja_id" style="visibility:hidden" id="caja_id" value="<?php echo $id;?>">

  </div>

  <div id="datos"></div>

</section>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/basistencia.js"></script>
</body>

</html>
