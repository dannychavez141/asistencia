<?php
error_reporting(0);
 include_once'./conexion.php'; 
 $descr = $_POST['desr'];
$sql="INSERT INTO `asistencia`.`curso` VALUES(null,'$descr',1);";

        $rs=$mysqli->query($sql);         
        $mysqli->close();
    


?>