<?php 
error_reporting(0);
require 'conexion.php';
 $anio = $_GET['anio']; 
 $alu = $_GET['alu'];
 $cur = $_POST['cur']; 

          
        $sql="INSERT INTO `asignacionalu` (`codAlu`, `idcurso`, `idAnioAcademico`, `est`) VALUES ('$alu', '$cur', '$anio', '1');";
        echo $sql;
  $rs=$mysqli->query($sql);
      
     header("Location: ../cursoalumno.php?tconf=true&&cod=$alu&&anio=$anio");
        exit;
 ?>