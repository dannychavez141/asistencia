<?php
error_reporting(0);
 include_once'./conexion.php'; 
 $clase = $_POST['clase'];
 $alumno = $_POST['alumno'];

$sql="INSERT INTO `asistencia`.`asistencia` (`idClase`, `codAlu`) VALUES ('$clase', '$alumno');";
        $rs=$mysqli->query($sql);         
        $mysqli->close();
?>