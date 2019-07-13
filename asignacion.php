
<!DOCTYPE html>
<html lang="zxx">
<?php error_reporting(0);
 
 include_once'./cabezera2.php'; 
$conf=$_GET['tconf'];
if ($conf) {
 echo "<script>alert('Operacion Realizada exitosamente');</script>";

} ?>
<body>
   <h1>ASIGNACIONES</h1>
  <table><tr><td><a href="asigalumno.php"><button><h1>CURSOS ASIGNADOS A ALUMNOS</h1></button></a></td><td><a href="asigdocente.php"><button><h1>CURSOS ASIGNADOS A DOCENTES</h1></button></a></td></tr></table>
</body>

</html>