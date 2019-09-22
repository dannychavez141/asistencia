<?php
error_reporting(0);
 include_once'./conexion.php';
 $clase= $_POST['clase'];
 $curso = $_POST['curso'];
 $fecha = $_POST['fecha'];
 $hora = $_POST['hora'];
 $est = $_POST['est'];

$sql="UPDATE `clase` SET `idAsignacionDoc`='$curso', `fechaClas`='$fecha', `horClas`='$hora', `est`='$est' WHERE `idClase`='$clase';";
        $rs=$mysqli->query($sql);         
        $mysqli->close();
?>