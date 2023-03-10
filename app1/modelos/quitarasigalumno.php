<?php 
error_reporting(0);
require 'conexion.php';
 $cod = $_GET['cod'];
 $est = $_GET['est']; 
 $anio = $_GET['anio']; 
 $alu = $_GET['alu'];
          
        $sql="UPDATE `asignacionalu` SET `est`='$est' WHERE `idasig`='$cod';";
        echo $sql;
  $rs=$mysqli->query($sql);
      
      header("Location: ../cursoalumno.php?tconf=true&&cod=$alu&&anio=$anio");
        exit;
 ?>