<?php
error_reporting(0);
 include_once'./conexion.php'; 
 $cod = $_POST['cod'];
 $descr = $_POST['desr'];
 $est = $_POST['idest'];
$sql="UPDATE `curso` SET `descr` = '$descr', `est` = $est WHERE `idCurso` = $cod";

        $rs=$mysqli->query($sql);         
        $mysqli->close();
    


?>