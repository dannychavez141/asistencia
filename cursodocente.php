
<!DOCTYPE html>
<html lang="zxx">
<?php error_reporting(0);
 
 include_once'./cabezera2.php'; 
 $cod=$_GET['cod'];
 $anio=$_POST['anio'];
$conf=$_GET['tconf'];
if ($conf) {
 echo "<script>alert('Operacion Realizada exitosamente');</script>";

} 
require 'conexion.php';
?>

<body>
  <h1>Cursos de Docentes Registrados</h1>

<table border="1">
<?php $url="SELECT * FROM asistencia.docente where idDocente='$cod';";
                     $clase= $mysqli->query($url);

  while ($fila = $clase->fetch_array()) {
$docente=$fila[2].' '.$fila[3].' '.$fila[1];
  	?>

	<tr><td><h1>DOCENTE:</h1></td><td><h1><?php echo $docente; ?></h1></td></tr>

<?php } ?>
<form></form>


<form action="cursodocente.php?cod=<?php echo $cod; ?>"    method="post" >
<tr><td><h1>SELECCIONE AÑO ACADEMICO:</h1></td><td> <h1><select name="anio">
<?php $url="SELECT * FROM asistencia.anioacademico order by idAnioAcademico desc;";
                     $clase= $mysqli->query($url);

  while ($fila = $clase->fetch_array()) {
  	?>
  	<?php echo $fila[0]; ?>
<option value="<?php echo $fila[0]; ?>"><?php echo $fila[1]; ?></option>
<?php } ?>
	
</select></h1>
</td><td><h1><button >VISUALIZAR</button></h1></td>
</tr>
</form>
<?php if ($anio!=null) {
?>
<form>
<tr><td colspan="2"><h1>Curso</h1></td><td colspan="2"><h1>ACCION</h1></td></tr>
<?php $url="SELECT * FROM asistencia.asignaciondoc a join curso c on a.idCurso=c.idCurso join anioacademico au on a.idAnioAcademico=au.idAnioAcademico where  a.idDocente=$cod and a.idAnioAcademico=$anio ;";
                     $clase= $mysqli->query($url);

  while ($fila = $clase->fetch_array()) {

  	?>

	<tr><td colspan="2"><h1><?php echo $fila[6]; ?></h1></td>
		<?php if ($fila[4]==1) {
			# code...
		 ?>
		<td><a href="controldocente.php?<?php echo $fila[0]; ?>&&est=1"><h1><input type="button" name="" value="DESHABILITAR"></h1></a></td>
<?php }else{ ?>
<td><a href="controldocente.php?<?php echo $fila[0]; ?>&&est=2"><h1><input type="button" name="" value="HABILITAR"></h1></a></td>
<?php } ?>
	</tr>

<?php } ?>
</form>
<?php } ?>




</table>
  

</body>

</html>