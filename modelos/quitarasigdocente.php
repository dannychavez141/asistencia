<?php 
error_reporting(0);
require 'conexion.php';
 $cod = $_GET['cod'];
 $est = $_GET['est']; 
 $anio = $_GET['anio']; 
 $doc = $_GET['doc'];
          
        $sql="UPDATE `asistencia`.`asignaciondoc` SET `est`='$est' WHERE `idAsignacionDoc`='$cod';";
        echo $sql;
  //$rs=$mysqli->query($sql);
      
      header("Location: ../cursodocente.php?tconf=true&&cod=$cod&&anio=$anio");
        exit;
 ?>