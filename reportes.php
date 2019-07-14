
<!DOCTYPE html>
<html lang="zxx">
<?php error_reporting(0);
 include_once'./cabezera2.php'; 
 $anio=$_POST['anio'];
 if ($anio==null) {
   $anio=$_GET['anio'];
 }
$conf=$_GET['tconf'];
if ($conf) {
 echo "<script>alert('Operacion Realizada exitosamente');</script>";

} 
require 'conexion.php';
?>

<body>
  <h1>REPORTE DE ASISTENCIAS DEL CICLO ACADEMICO</h1>

<table border="1"> 
<form action="reportes.php"   method="post" >
<tr><td bgcolor="#81C784"><h1>SELECCIONE AÑO ACADEMICO:</h1></td><td bgcolor="#F1F8E9"> <h1><select name="anio">
<?php $url="SELECT * FROM asistencia.anioacademico order by idAnioAcademico desc;";
                     $clase= $mysqli->query($url);

  while ($fila = $clase->fetch_array()) {
  	?>
  <option value="<?php echo $fila[0]; ?>"><?php echo $fila[1]; ?></option>
<?php } ?>
	
</select></h1>
</td><td><h1><button >VISUALIZAR</button></h1></td>
</tr>
</form>
<?php if ($anio!=null) {
?>

<?php $url="SELECT * FROM asistencia.anioacademico where idAnioAcademico='$anio'";
                     $aniouni= $mysqli->query($url);

  while ($fila = $aniouni->fetch_array()) {
  	?>
  	
<tr><td colspan="2" bgcolor="#03A9F4"><h1>AÑO ACADEMICO SELECCIONADO:</h1></td><td bgcolor="#B2EBF2"><h1><?php echo $fila[1] ?></h1></td></tr>
<?php } ?>
<form action="reporteciclo.php?anio=<?php echo $anio; ?>"    method="post" target="_blank">
<tr><td bgcolor="#AB47BC
  "><h1>SELECCIONE CURSO A ASIGNAR:</h1></td><td bgcolor="#E1BEE7"> 
	<h1><select name="cur">
<?php $cont=0;
$url="SELECT distinct c.idCurso,c.descr from asistencia.asignaciondoc ad join curso c on ad.idCurso=c.idCurso where ad.est=1 and ad.idAnioAcademico='$anio' ;";
                     $clase= $mysqli->query($url);

  while ($fila = $clase->fetch_array()) {
    $cont++;
  	?>
  <option value="<?php echo $fila[0]; ?>"><?php echo $fila[1]; ?></option>
<?php } if ($cont==0) { ?>
	 <option value=""> NO SE TIENEN CURSOS ASIGNADOS EN ESTE CICLO</option><?php } ?>
</select></h1>
<?php if ($cont!=0) { ?>
</td><td><h1><button >GENERAR REPORTE</button></h1></td>
<?php } ?>
</tr>
</form>

<?php }  ?>

</table>
  

</body>

</html>