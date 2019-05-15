<?php
error_reporting(0);
 include_once'./conexion.php'; 
 $curso = $_POST['curso'];
 $fecha = $_POST['fecha'];
 $hora = $_POST['hora'];
$sql="INSERT INTO `asistencia`.`clase` (`idAsignacionDoc`, `fechaClas`, `horClas`, `est`) VALUES ('$curso', '$fecha', '$hora', '1');";
        $rs=$mysqli->query($sql);         
        $mysqli->close();
?>